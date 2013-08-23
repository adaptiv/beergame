require 'spec_helper'

describe Player do
  let(:game) { Game.create }
  let(:player) { game.player }

  it "should create a week record when receiving delivery and order" do
    expect {
      player.receive_delivery_and_order(1, 2)
    }.to change { WeekRecord.count }.by(1)
  end

  it "should deliver orders less than inventory" do
    expect(player.calculate_delivery_to_customer(12, 11)).to eq 11
  end

  it "should deliver orders that are inventory sized" do
    expect(player.calculate_delivery_to_customer(12, 12)).to eq 12
  end

  it "should not deliver more than inventory on big orders" do
    expect(player.calculate_delivery_to_customer(12, 13)).to eq 12
  end

  context 'balance for current inventory' do
    it "should be -1 per crate when the inventory is positive" do
      expect(player.calculate_balance(0, 1)).to eq -1
    end

    it "should be 0 when inventory is empty" do
      expect(player.calculate_balance(0, 0)).to eq 0
    end

    it "should be -2 per crate when the inventory is negative" do
      expect(player.calculate_balance(0, -1)).to eq -2
    end

    it 'should accumulate over consecutive weeks' do
      expect(player.calculate_balance(-12, -1)).to eq -14
    end
  end
end
