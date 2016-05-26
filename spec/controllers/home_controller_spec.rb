require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET show" do
    it "renders the show template" do
      VCR.use_cassette("HomeController#show") do
        get :show

        expect(response).to render_template(:show)
      end
    end
  end
end
