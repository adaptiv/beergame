class Player < ActiveRecord::Base
  belongs_to :game
  has_many :week_records

  def current_week_record
    week_records.find_by_week(game.week)
  end

  def receive_delivery_and_order(delivery_from_supplier, order_from_customer)
    receive_delivery_from_supplier(delivery_from_supplier)
    delivery_to_customer = send_delivery_to_customer(order_from_customer)
    self.week_records.create(
      week:                   game.week,
      delivery_from_supplier: delivery_from_supplier,
      order_from_customer:    order_from_customer,
      delivery_to_customer:   delivery_to_customer,
      inventory:              self.inventory
    )
    save
  end

  private

  def receive_delivery_from_supplier(delivery_from_supplier)
    self.inventory += delivery_from_supplier
  end

  def send_delivery_to_customer(order_from_customer)
    delivery_to_customer = if order_from_customer <= self.inventory
                             order_from_customer
                           else
                             self.inventory
                           end
    self.inventory -= delivery_to_customer
    delivery_to_customer
  end
end
