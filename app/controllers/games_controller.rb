class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def create
    @game = Game.create
    redirect_to @game
  end

  def show
    @game = Game.find params[:id]
    @player = @game.players.first
  end
end