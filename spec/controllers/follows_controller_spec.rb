require 'rails_helper'

RSpec.describe FollowsController, type: :controller do
  describe "POST #create" do
    it "redirects to the follows show path" do
      VCR.use_cassette("FollowsController POST#create") do
        user = create(:user)
        ApplicationController.any_instance.stubs(:current_user).returns(user)
        post :create, id: "TrumpSC"

        expect(response).to redirect_to(following_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the follows show path" do
      VCR.use_cassette("FollowsController DELETE#destroy") do
        user = create(:user)
        ApplicationController.any_instance.stubs(:current_user).returns(user)
        post :destroy, id: "TrumpSC"

        expect(response).to redirect_to(following_path)
      end
    end
  end
end
