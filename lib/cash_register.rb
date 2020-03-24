require 'pry'
class CashRegister
  
  attr_accessor :discount, :items, :last_transaction, :total, :is_discount_applied
  
  def initialize(discount: 0)
    @discount = discount.to_f
    @is_discount_applied = false
    @items = []
    @last_transaction
    @total = 0
  end
  
  def add_item(item, price, quantity = 1)
    self.total += price * quantity
    items << Item.new(name: item, quantity: quantity)
    self.last_transaction = price * quantity
  end
  
  def apply_discount
    return if is_discount_applied
    self.is_discount_applied = true
    return if discount.zero?
    
    self.total = (total * ((100 - discount)/100)).to_i
  end
  
  def latest_discount_message
    return "There is no discount to apply." if discount.zero?
    
    "After the discount, the total comes to $#{total}."
  end
  
  def void_last_transaction
    self.total -= last_transaction
  end
  
end

class Item
  attr_accessor :name, :quantity
  
  def initialize(name:, quantity:)
    @name, @quantity = name, quantity
  end
end