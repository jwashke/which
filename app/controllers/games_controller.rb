class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = params[:id]
    @streams = Stream.find_by(params[:id])
  end
end
