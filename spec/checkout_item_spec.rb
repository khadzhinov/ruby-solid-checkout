require_relative '../lib/checkout_item'

describe CheckoutItem do
  before { @item = described_class.new('code', 10.99) }

  it { expect(@item.code).to eq('code') }
  it { expect(@item.price).to eq(10.99) }
end
