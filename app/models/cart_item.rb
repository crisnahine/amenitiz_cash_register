class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  delegate :code, to: :product, prefix: true
end
