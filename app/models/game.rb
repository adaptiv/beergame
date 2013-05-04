class Game < ActiveRecord::Base
  has_many :players

  after_create :create_players

  def player
    @player ||= players.first
  end

  def next_week
    player.receive_delivery_and_order(4, 4)
  end

  private

  def create_players
    players.create
  end
end
