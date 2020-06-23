require_relative '../lib/item'

describe Item do
  before { @product = described_class.new('code', 'name', 10.99) }

  it { expect(@product.code).to eq('code') }
  it { expect(@product.name).to eq('name') }
  it { expect(@product.price).to eq(10.99) }
end
