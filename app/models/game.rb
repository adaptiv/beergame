class Game < ActiveRecord::Base
  has_many :players

  after_create :create_players

  private

  def create_players
    players.create
  end
end
