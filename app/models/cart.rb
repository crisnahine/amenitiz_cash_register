class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items

  def total_price
    grouped = cart_items.includes(:product).group_by(&:product_code)

    grouped.sum do |code, items|
      quantity = items.size
      price = items.first.product.price

      case code
      when "GR1"
        paid_items = (quantity / 2.0).ceil
        paid_items * price
      when "SR1"
        quantity * (quantity >= 3 ? 4.5 : price)
      when "CF1"
        price = quantity >= 3 ? (price * 2 / 3.0).round(2) : price
        quantity * price
      else
        quantity * price
      end
    end.round(2)
  end
end
