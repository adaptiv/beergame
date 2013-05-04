class WeekRecord < ActiveRecord::Base
  belongs_to :player

  attr_accessible :week, :delivery_from_supplier, :order_from_customer, :delivery_to_customer, :inventory
end