require 'rails_helper'
include RandomData

RSpec.describe WikisController, type: :controller do

    let(:my_wiki) { create(:wiki)}

    let(:user) { create(:user) }

    describe "GET #index" do

        before :each do
            sign_in user
        end

        it "returns http success" do
            get :index
            expect(response).to render_template :index
        end

        it "assigns [my_wiki] to @wikis" do
            get :index
            expect(assigns(:wikis)).to eq([my_wiki])
        end

    end

end
