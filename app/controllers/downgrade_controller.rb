class DowngradeController < ApplicationController

    def index
    end

    def confirm
        if user_signed_in?
            current_user.wikis.where(private: true).update_all(private: false)
            current_user.to_standard
            flash[:notice] = "You are now a Standard Member."
            redirect_to wikis_path
        end
    end
end
