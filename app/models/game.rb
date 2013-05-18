class Game < ActiveRecord::Base
  has_many :players

  after_create :create_players

  def player
    @player ||= players.first
  end

  def next_week
    update_attributes(week: week+1)
    receive_delivery_and_order
  end

  def receive_delivery_and_order
    player.receive_delivery_and_order(4, 4)
  end

  private

  def create_players
    players.create
  end
end
