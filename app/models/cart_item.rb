class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality: {only_integer: true }

  def subtotal(cart_item)

    cart_item.item.tax_in_price * cart_item.count

  end

  def total_price(cart_items)

    total_price = 0

    cart_items.each do |cart_item|

      total_price += subtotal(cart_item)

  end

    return total_price

  end

end
