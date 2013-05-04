class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def create
    @game = Game.create
    @game.next_week
    redirect_to @game
  end

  def show
    @game = Game.find params[:id]
    @player = @game.players.first
    @current_week = @player.current_week
  end
end