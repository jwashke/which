require "rails_helper"

RSpec.describe Stream do
  describe "#initialize" do
    it "assigns @game" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.game).to eq("Game Name")
    end

    it "assigns @viewers" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.viewers).to eq("100")
    end

    it "assigns @preview" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.preview).to eq("http://example.com/preview")
    end

    it "assigns @name" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.name).to eq("Streamer")
    end

    it "assigns @description" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.description).to eq("Description")
    end

    it "assigns @logo" do
      stream = Stream.new(raw_stream_hash)

      expect(stream.logo).to eq("http://example.com/logo")
    end
  end

  describe ".find_by" do
    it "returns an array of 25 streams for a game" do
      VCR.use_cassette("Stream.find_by") do
        streams = Stream.find_by("Overwatch")
        stream = streams.first

        expect(streams.count).to eq(25)
        expect(stream.class).to eq(Stream)
      end
    end
  end

  describe ".find" do
    it "returns a stream object for a specific channel" do
      VCR.use_cassette("Stream.find") do
        stream = Stream.find("TrumpSC")

        expect(stream.class).to eq(Stream)
        expect(stream.name).to eq("TrumpSC")
      end
    end
  end

  describe ".featured" do
    it "returns an array of 12 featured stream objects" do
      VCR.use_cassette("Stream.featured") do
        streams = Stream.featured
        stream = streams.first

        expect(streams.count).to eq(12)
        expect(stream.class).to eq(Stream)
      end
    end
  end

  describe ".followed" do
    it "returns an array of up to 25 streams the logged in user is following" do
      VCR.use_cassette("Stream.followed") do
        streams = Stream.followed(ENV["USER_TOKEN"])
        stream = streams.first

        expect(streams.count).to eq(3)
        expect(stream.class).to eq(Stream)
      end
    end
  end

  def raw_stream_hash
    {
      game: "Game Name",
      viewers: "100",
      preview: {
        medium: "http://example.com/preview"
      },
      channel: {
        display_name: "Streamer",
        status: "Description",
        logo: "http://example.com/logo"
      }
    }
  end
end
