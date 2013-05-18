class AddWeekToGame < ActiveRecord::Migration
  def change
    add_column :games, :week, :integer, default: 1
  end
end
