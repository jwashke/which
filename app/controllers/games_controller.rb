class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @streams = Stream.find_by(params[:id])
  end
end
