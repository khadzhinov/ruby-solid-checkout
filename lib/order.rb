require_relative 'checkout_item'

class Order
  attr_reader :items

  def initialize
    @items = {}
  end

  def add_item(item)
    item = CheckoutItem.new(item.code, item.price)
    items[item.code] ||= item
    items[item.code].quantity += 1
  end
end
