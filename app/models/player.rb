class Player < ActiveRecord::Base
  belongs_to :game
  has_many :week_records

  def current_week_record
    week_records.find_by_week(game.week)
  end

  def receive_delivery_and_order(delivery_from_supplier, order_from_customer)
    new_inventory        = calculate_received_inventory(self.inventory, delivery_from_supplier)
    delivery_to_customer = calculate_delivery_to_customer(new_inventory, order_from_customer)
    self.inventory       = calculate_delivered_inventory(new_inventory, order_from_customer)
    self.balance         = calculate_balance(self.balance, self.inventory)
    save

    self.week_records.create(
      week:                   game.week,
      delivery_from_supplier: delivery_from_supplier,
      order_from_customer:    order_from_customer,
      delivery_to_customer:   delivery_to_customer,
      inventory:              self.inventory,
      balance:                self.balance
    )
  end

  def calculate_received_inventory(inventory, delivery_from_supplier)
    inventory + delivery_from_supplier
  end

  def calculate_delivered_inventory(inventory, order_from_customer)
    inventory - order_from_customer
  end

  def calculate_delivery_to_customer(inventory, order_from_customer)
    if order_from_customer <= inventory
      order_from_customer
    else
      inventory
    end
  end

  def calculate_balance(balance, inventory)
    balance + (inventory > 0 ? inventory * -1 : inventory * 2)
  end
end
