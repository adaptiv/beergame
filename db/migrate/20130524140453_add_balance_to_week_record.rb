class AddBalanceToWeekRecord < ActiveRecord::Migration
  def change
    add_column :week_records, :balance, :integer, default: 0
  end
end
