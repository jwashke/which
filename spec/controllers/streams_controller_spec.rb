require "rails_helper"

RSpec.describe StreamsController, type: :controller do
  describe "GET #show" do
    it "sets stream to the stream by channel name" do
      VCR.use_cassette("StreamsController GET#show") do
        get :show, id: "TrumpSC"

        expect(assigns[:stream].name).to eq("TrumpSC")
        expect(response).to render_template(:show)
      end
    end
  end
end
