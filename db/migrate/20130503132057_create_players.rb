class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :game_id
      t.integer :inventory, default: 12
      t.timestamps
    end
  end
end
