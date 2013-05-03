class CreateWeekRecords < ActiveRecord::Migration
  def change
    create_table :week_records do |t|
      t.integer :player_id, null: false
      t.integer :week, null: false
      t.integer :delivery_from_supplier, null: false
      t.integer :order_from_customer, null: false
      t.integer :delivery_to_customer, null: false
      t.integer :order_to_supplier
      t.timestamps
    end
  end
end
