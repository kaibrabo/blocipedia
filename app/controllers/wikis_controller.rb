include ApplicationHelper

class WikisController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show]

    def index

        @wikis = policy_scope(Wiki)

        if current_user.premium?
            @private_wikis = Wiki.where(private: true)
        else
            @private_wikis = Wiki.joins(:collaborators).where('private = ? AND (wikis.user_id = ? OR collaborators.user_id = ?)', true, current_user.id, current_user.id)
        end

        @public_wikis = Wiki.where(private: false)

    end

    def show

        @wiki = Wiki.find(params[:id])
    end

    def new

        @wiki = Wiki.new
    end

    def create

        @wiki = Wiki.new
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        @wiki.user = current_user
        # premium and admin users only
        @wiki.private = params[:wiki][:private]
        @wiki.collaborators = params[:wiki][:collaborators]

        if @wiki.save!
            flash[:notice] = "Wiki was Saved."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving your Wiki, Please try again."
            render :new
        end
    end

    def edit

        @wiki = Wiki.find(params[:id])
    end

    def update

        @wiki = Wiki.find(params[:id])
        @wiki.title = params[:wiki][:title]
        @wiki.body = params[:wiki][:body]
        is_private = params[:wiki][:private]
        collaborators = params[:collaborators]
        # premium and admin users only

        if current_user.premium? && is_private && collaborators
            @wiki.private = is_private

            @wiki.collaborators = Collaborator.create_from_user_ids(collaborators[:user_id], @wiki.id)
        end

        if @wiki.save

            flash[:notice] = "Wiki was updated."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving the post. Please try again."
            render :edit
        end

    end

    def destroy

        @wiki = Wiki.find(params[:id])

        if @wiki.destroy
            flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
            redirect_to wikis_path
        else
            flash.now[:alert] = "There was an error deleting the wiki."
            render :show
        end
    end

    private


end
