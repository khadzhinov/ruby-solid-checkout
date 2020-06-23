require_relative 'special_price_rule'
require_relative 'special_total_rule'

class RulesList
  attr_reader :pricing_rules, :total_rules

  def initialize
    @pricing_rules = [
      SpecialPriceRule.new('A', 3, 75.00),
      SpecialPriceRule.new('B', 2, 35.00)
    ]
    @total_rules = [SpecialTotalRule.new(150, 20)]
  end

  def apply_item_rules(items)
    items.map do |code, item|
      @pricing_rules.each { |rule| rule.code == code ? rule.apply(item) : next }
    end
  end

  def apply_total_rules(total)
    @total = total
    @total_rules.each { |total_rule| @total = total_rule.apply(@total) }
    @total
  end
end
