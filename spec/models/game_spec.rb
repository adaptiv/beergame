require 'spec_helper'

describe Game do
  let(:game) { Game.create }
  let(:player) { game.player }

  it "should send delivery and order to player when moving to the next week" do
    player.should_receive(:receive_delivery_and_order).with(4, 4)
    game.receive_delivery_and_order
  end
end