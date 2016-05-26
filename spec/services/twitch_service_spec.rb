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

        hash = service.follow("JoshOG", "mrjoshuagiraffe", "g7zrb07t3qne66s4r2m8174aiowv77")
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

        hash = service.unfollow("JoshOG", "mrjoshuagiraffe", "g7zrb07t3qne66s4r2m8174aiowv77")
        hash = service.followed_hash(0)
        expect(hash.count).to eq(2)
      end
    end
  end
end
