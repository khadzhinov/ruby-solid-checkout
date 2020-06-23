class SpecialPriceRule
  attr_reader :code

  def initialize(code, quantity, special_price)
    @code = code
    @quantity = quantity
    @special_price = special_price
  end

  def apply(item)
    item.total = @special_price if item.code == @code && item.quantity == @quantity
  end
end
