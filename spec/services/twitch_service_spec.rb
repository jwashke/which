require "rails_helper"

RSpec.describe TwitchService do
  describe "#followed_hash" do
    it "returns the parsed hash of the followed streams" do
      VCR.use_cassette("TwitchService followed_hash") do
        service = TwitchService.new
        hash = service.followed_hash(0)
        expect(hash.count).to eq(2)
      end
    end
  end

  describe "#games_hash" do
    it "returns the parsed hash of the top 12 games" do
      VCR.use_cassette("TwitchService games_hash") do
        service = TwitchService.new
        hash = service.games_hash
        expect(hash.count).to eq(12)
      end
    end
  end

  describe "#featured_hash" do
    it "returns the parsed hash of 12 featured streams" do
      VCR.use_cassette("TwitchService featured_hash") do
        service = TwitchService.new
        hash = service.featured_hash
        expect(hash.count).to eq(12)
      end
    end
  end

  describe "#streams_hash" do
    it "returns the parsed hash of 25 streams for a given game" do
      VCR.use_cassette("TwitchService streams_hash") do
        service = TwitchService.new
        hash = service.streams_hash("Overwatch")
        expect(hash.count).to eq(25)
      end
    end
  end

  describe "#channel_hash" do
    it "returns the parsed hash of a specific live channel" do
      VCR.use_cassette("TwitchService channel_hash") do
        service = TwitchService.new
        hash = service.channel_hash("Savjz")
        expect(hash.count).to eq(1)
      end
    end
  end

  describe "#follow" do
    it "follows the given channel for the given user account" do
      VCR.use_cassette("TwitchService follow") do
        service = TwitchService.new
        hash = service.followed_hash(0)
        expect(hash.count).to eq(2)

        hash = service.follow("JoshOG", "mrjoshuagiraffe", 0)
        hash = service.followed_hash(0)
        expect(hash.count).to eq(3)
      end
    end
  end

  describe "#unfollow" do
    it "unfollows the given channel for the given user account" do
      VCR.use_cassette("TwitchService unfollow") do
        service = TwitchService.new
        hash = service.followed_hash(0)
        expect(hash.count).to eq(3)

        hash = service.unfollow("JoshOG", "mrjoshuagiraffe", 0)
        hash = service.followed_hash(0)
        expect(hash.count).to eq(2)
      end
    end
  end

  describe "#get_followed" do
    it "gets the response of the followed streams" do
      VCR.use_cassette("TwitchService followed_hash") do
        service = TwitchService.new
        response = service.get_followed(0)

        expect(response.body).to include("Hearthstone")
        expect(response.body).to include("AmazHS")
      end
    end
  end

  describe "#get_featured" do
    it "gets the response of the featured streams" do
      VCR.use_cassette("TwitchService featured_hash") do
        service = TwitchService.new
        response = service.get_featured

        expect(response.body).to include("Deadmau5")
        expect(response.body).to include("WARHAMMER")
      end
    end
  end

  describe "#get_channel" do
    it "gets the response of the requested channel" do
      VCR.use_cassette("TwitchService channel_hash") do
        service = TwitchService.new
        response = service.get_channel("Savjz")

        expect(response.body).to include("Hearthstone")
        expect(response.body).to include("yogg druid")
      end
    end
  end

  describe "#get_streams" do
    it "returns the response of 25 streams for a given game" do
      VCR.use_cassette("TwitchService streams_hash") do
        service = TwitchService.new
        response = service.get_streams("Overwatch")

        expect(response.body).to include("JoshOG")
        expect(response.body).to include("Overwatch-OG")
      end
    end
  end

  describe "#get_games" do
    it "returns the response of the top 12 games" do
      VCR.use_cassette("TwitchService games_hash") do
        service = TwitchService.new
        response = service.get_games

        expect(response.body).to include("Overwatch")
        expect(response.body).to include("League of Legends")
        expect(response.body).to include("Hearthstone")
      end
    end
  end

  describe "#parse" do
    it "parses JSON response and symbolized the names" do
      VCR.use_cassette("TwitchService games_hash") do
        service = TwitchService.new
        response = service.get_games
        parsed = service.parse(response)

        expect(parsed[:_total]).to eq(1025)
        expect(parsed.count).to eq(3)
      end
    end
  end

  describe "#remove_whitespace" do
    it "replaces spaces in a string with '+'" do
      service = TwitchService.new
      string = "Hearthstone: Heroes of Warcraft"
      formatted_string = service.remove_whitespace(string)

      expect(formatted_string).to eq("Hearthstone:+Heroes+of+Warcraft")
    end
  end
end

class TwitchService
  public :get_followed,
         :get_featured,
         :get_channel,
         :get_streams,
         :get_games,
         :parse,
         :remove_whitespace
end
