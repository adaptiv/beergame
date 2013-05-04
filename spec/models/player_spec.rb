describe Player do
  let(:player) { Player.create }

  it "should create a week record when moving to the next week" do
    expect {
      player.receive_delivery_and_order(1, 2)
    }.to change { WeekRecord.count }.by(1)
  end

  it "should deliver small orders" do
    expect(player.send(:send_delivery_to_customer, 11)).to eq 11
  end

  it "should deliver orders that are inventory sized" do
    expect(player.send(:send_delivery_to_customer, 12)).to eq 12
  end

  it "should not deliver more than inventory on big orders" do
    expect(player.send(:send_delivery_to_customer, 13)).to eq 12
  end
end
