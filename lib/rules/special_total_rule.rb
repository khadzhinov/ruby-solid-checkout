class SpecialTotalRule
  def initialize(total, discount)
    @total = total
    @discount = discount
  end

  def apply(total)
    total > @total ? total - @discount : total
  end
end
