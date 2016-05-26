require "rails_helper"

RSpec.describe GamesController, type: :controller do
  describe "GET #index" do
    it "sets games to be the top 12 games being streamed" do
      VCR.use_cassette("GamesController GET#index") do
        get :index

        expect(assigns[:games].count).to eq(12)
        expect(response).to render_template(:index)
      end
    end
  end

  describe "GET #show" do
    it "sets streams to the top 24 streams for the given game" do
      VCR.use_cassette("GamesController GET#show") do
        get :show, id: "League of Legends"

        expect(assigns[:streams].count).to eq(25)
        expect(response).to render_template(:show)
      end
    end
  end
end
