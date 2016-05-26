require "rails_helper"

RSpec.describe Game do
  describe "#initialize" do
    it "assigns @viewers" do
      game = Game.new(raw_game_hash)

      expect(game.viewers).to eq("100")
    end

    it "assigns @channels" do
      game = Game.new(raw_game_hash)

      expect(game.channels).to eq("25")
    end

    it "assigns @name" do
      game = Game.new(raw_game_hash)

      expect(game.name).to eq("Game Name")
    end

    it "assigns @box_art" do
      game = Game.new(raw_game_hash)

      expect(game.box_art).to eq("http://example.com")
    end
  end

  describe ".all" do
    it "returns an array of 12 game objects" do
      VCR.use_cassette("Game.all") do
        games = Game.all
        game = games.first

        expect(games.count).to eq(12)
        expect(game.class).to eq(Game)
      end
    end
  end

  def raw_game_hash
    {
      viewers: "100",
      channels: "25",
      game: {
        name: "Game Name",
        box: {
          large: "http://example.com"
        }
      }
    }
  end
end
