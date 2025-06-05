require 'rails_helper'

RSpec.describe Cart, type: :model do
  it "applies Green Tea BOGOF pricing" do
    tea = Product.create!(code: 'GR1', name: 'Green Tea', price: 3.11)
    cart = Cart.create!
    3.times { cart.cart_items.create!(product: tea) }

    expect(cart.total_price).to eq(6.22)
  end

  it "applies Strawberry bulk pricing (3 or more → €4.50 each)" do
    product = Product.create!(code: 'SR1', name: 'Strawberries', price: 5.00)
    cart = Cart.create!
    3.times { cart.cart_items.create!(product: product) }

    expect(cart.total_price).to eq(13.50) # 3 × €4.50
  end

  it "applies Coffee volume discount (3 or more → €7.49 each)" do
    product = Product.create!(code: 'CF1', name: 'Coffee', price: 11.23)
    cart = Cart.create!
    3.times { cart.cart_items.create!(product: product) }

    expect(cart.total_price).to eq(22.47) # 3 × €7.49
  end

  it "applies all pricing rules in a mixed cart" do
    gr1 = Product.create!(code: 'GR1', name: 'Green Tea', price: 3.11)
    sr1 = Product.create!(code: 'SR1', name: 'Strawberries', price: 5.00)
    cf1 = Product.create!(code: 'CF1', name: 'Coffee', price: 11.23)

    cart = Cart.create!
    cart.cart_items.create!(product: gr1)
    cart.cart_items.create!(product: sr1)
    cart.cart_items.create!(product: gr1)
    cart.cart_items.create!(product: gr1)
    cart.cart_items.create!(product: cf1)

    # GR1 x3 → pay for 2 = 6.22
    # SR1 x1 → 5.00
    # CF1 x1 → 11.23
    expect(cart.total_price).to eq(22.45)
  end
end