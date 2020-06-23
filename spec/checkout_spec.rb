require_relative '../lib/checkout'
require_relative '../lib/rules/rules_list'

describe Checkout do
  let(:pricing_rules) { RulesList.new }
  let(:co) { described_class.new(pricing_rules) }
  let(:item_a) { Item.new('A', 'Item A', 30.00) }
  let(:item_b) { Item.new('B', 'Item B', 20.00) }
  let(:item_c) { Item.new('C', 'Item C', 50.00) }
  let(:item_d) { Item.new('D', 'Item D', 15.00) }

  describe '#total' do
    context 'example 1' do
      before do
        co
        co.scan(item_a)
        co.scan(item_b)
        co.scan(item_c)
      end

      it { expect(co.total).to eq(100.00) }
    end

    context 'example 2' do
      before do
        co
        co.scan(item_b)
        co.scan(item_a)
        co.scan(item_b)
        co.scan(item_a)
        co.scan(item_a)
      end

      it { expect(co.total).to eq(110.00) }
    end

    context 'example 3' do
      before do
        co
        co.scan(item_c)
        co.scan(item_b)
        co.scan(item_a)
        co.scan(item_a)
        co.scan(item_d)
        co.scan(item_a)
        co.scan(item_b)
      end

      it { expect(co.total).to eq(155.00) }
    end

    context 'example 3' do
      before do
        co
        co.scan(item_c)
        co.scan(item_a)
        co.scan(item_d)
        co.scan(item_a)
        co.scan(item_a)
      end

      it { expect(co.total).to eq(140.00) }
    end
  end
end
