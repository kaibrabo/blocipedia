class DowngradeController < ApplicationController

    def index
    end

    def confirm
        if user_signed_in?
            current_user.to_standard
            redirect_to edit_user_registration_path
        end
    end
end
