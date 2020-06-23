require_relative '../lib/order'
require_relative '../lib/item'

describe Order do
  describe '#add_item' do
    before do
      @order = described_class.new
      item_a = Item.new('A', 'Item A', 29.99)
      item_b = Item.new('B', 'Item B', 19.99)
      @order.add_item(item_a)
      @order.add_item(item_a)
      @order.add_item(item_b)
      @first_item = @order.items.first[1]
    end

    it { expect(@order.items.length).to eq(2) }
    it { expect(@first_item.code).to eq('A') }
    it { expect(@first_item.quantity).to eq(2) }
    it { expect(@first_item.price).to eq(29.99) }
  end
end
