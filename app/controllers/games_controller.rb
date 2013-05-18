class GamesController < ApplicationController
  def index
  end

  def create
    game = Game.create
    game.receive_delivery_and_order
    redirect_to game
  end

  def show
    @game = Game.find params[:id]
    @player = @game.players.first
    @week_record = @player.current_week_record
  end
end