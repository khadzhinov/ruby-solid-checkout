require_relative '../lib/rules/rules_list'
require_relative '../lib/order'
require_relative '../lib/item'

describe RulesList do
  let(:order) { Order.new }
  let(:rules) { described_class.new }

  describe "#apply_item_rules" do
    before do
      i1 = Item.new('A', 'Item A', 40.00)
      i2 = Item.new('B', 'Item B', 50.00)
      order.add_item(i1)
      order.add_item(i1)
      order.add_item(i1)
      order.add_item(i2)
      order.add_item(i2)
      rules.apply_item_rules(order.items)
    end

    it { expect(order.items['A'].total).to eq(75.0) }
    it { expect(order.items['B'].total).to eq(35.0) }
  end
end
