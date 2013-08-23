class AddBalanceToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :balance, :integer, default: 0
  end
end
