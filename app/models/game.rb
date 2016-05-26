class Game
  attr_reader :viewers, :channels, :name, :id, :box_art

  def initialize(raw_game)
    @viewers = raw_game[:viewers]
    @channels = raw_game[:channels]
    @name = raw_game[:game][:name]
    @box_art = raw_game[:game][:box][:large]
  end

  def self.all
    TwitchService.new.games_hash.map do |raw_game|
      Game.new(raw_game)
    end
  end
end
