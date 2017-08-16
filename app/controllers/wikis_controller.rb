class WikisController < ApplicationController

    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @wikis = Wiki.all
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

        if @wiki.save!
            flash[:notice] = "Wiki was Saved."
            redirect_to @wiki
        else
            flash.now[:alert] = "There was an error saving your Wiki, Please try again."
            render :new
        end
    end

    def edit
    end
end
