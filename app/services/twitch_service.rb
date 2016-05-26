class TwitchService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://api.twitch.tv/kraken")
    connection.headers["Accept"] = "application/vnd.twitchtv.v3+json"
    connection.headers["Client-ID"] = "bk947yhs5fgjushej8xtark89x1h0jv"
  end

  def followed_hash(token)
    parse(get_followed(token))[:streams]
  end

  def games_hash
    parse(get_games)[:top]
  end

  def featured_hash
    parse(get_featured)[:featured]
  end

  def streams_hash(game)
    parse(get_streams(game))[:streams]
  end

  def channel_hash(channel)
    parse(get_channel(channel))[:streams]
  end

  private

  def get_followed(token)
    connection.headers["Authorization"] = "OAuth #{token}"
    connection.get("streams/followed")
  end

  def get_featured
    connection.get("streams/featured?limit=12")
  end

  def get_channel(channel)
    channel = channel.tr(" ", "+")
    connection.get("streams?channel=#{channel}")
  end

  def get_streams(game)
    game = game.tr(" ", "+")
    connection.get("streams?game=#{game}")
  end

  def get_games(num = "12")
    connection.get("games/top?limit=#{num}")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
