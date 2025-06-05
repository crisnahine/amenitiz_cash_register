class Api::CartsController < ApplicationController
  def create
    cart = Cart.create!
    params[:product_codes].each do |code|
      product = Product.find_by(code: code)
      cart.cart_items.create!(product: product) if product
    end

    render json: { total_price: cart.total_price }
  end
end
