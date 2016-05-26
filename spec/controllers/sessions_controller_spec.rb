require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "POST #create" do
    context "It finds or creates the user" do
      it "sets the session user id to the user" do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitch]
        post :create
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "redirects to the root path" do
        request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitch]
        post :create
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "clears the session" do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitch]
      post :create
      expect(session[:user_id]).to eq(User.last.id)

      delete :destroy
      expect(session[:user_id]).to be(nil)
    end

    it "redirects to the root path" do
      delete :destroy
      expect(response).to redirect_to(root_path)
    end
  end
end
