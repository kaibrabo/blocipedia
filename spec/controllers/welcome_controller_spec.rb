require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

    context "when guest user" do
        describe "GET #index" do
            it "returns http success" do
                get :index
                expect(response).to redirect_to(new_user_session_path)
            end
        end

        describe "GET #about" do
            it "returns http success" do
                get :about
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end


end
