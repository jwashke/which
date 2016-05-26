class Stream
  attr_reader :game, :viewers, :preview, :name, :description, :logo
  def initialize(raw_stream)
    @game = raw_stream[:game]
    @viewers = raw_stream[:viewers]
    @preview = raw_stream[:preview][:medium]
    @name = raw_stream[:channel][:display_name]
    @description = raw_stream[:channel][:status]
    @logo = raw_stream[:channel][:logo]
  end

  def self.find_by(game)
    TwitchService.new.streams_hash(game).map do |raw_stream|
      Stream.new(raw_stream)
    end
  end

  def self.find(channel)
    raw_channel = TwitchService.new.channel_hash(channel)
    Stream.new(raw_channel.first)
  end

  def self.featured
    TwitchService.new.featured_hash.map do |raw_stream|
      Stream.new(raw_stream[:stream])
    end
  end

  def self.followed(token)
    TwitchService.new.followed_hash(token).map do |raw_stream|
      Stream.new(raw_stream)
    end
  end
end
