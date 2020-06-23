require_relative 'order'

class Checkout
  attr_reader :order

  def initialize(pricing_rules)
    @rules = pricing_rules
    @order = Order.new
  end

  def scan(item)
    @order.add_item(item)
  end

  def total
    @total = 0.0
    @rules.apply_item_rules(@order.items)
    @order.items.each { |_code, item| @total += item.total.zero? ? item.price * item.quantity : item.total }
    @rules.apply_total_rules(@total)
  end
end
