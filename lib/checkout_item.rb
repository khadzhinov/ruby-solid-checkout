class CheckoutItem
  attr_reader :code
  attr_accessor :quantity, :price, :total

  def initialize(code, price)
    @code = code
    @price = price
    @quantity = 0
    @total = 0
  end
end
