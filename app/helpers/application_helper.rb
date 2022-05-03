module ApplicationHelper

def full_name(customer)

    customer.last_name + customer.first_name

end

def full_name_kana(customer)

    customer.last_name_kana + customer.first_name_kana

end


def full_address(key)

  "#{key.postal_code}#{key.address}"

end

def current_cart

  @cart_items = current_customer.cart_items

end

  # 小計
def subtotal(cart_item)

    (cart_item.item.tax_price * cart_item.amount).floor

end

# 合計金額の計算
  def total_price(totals)

    price = 0

    totals.each do |total|

      price  +=  subtotal(total)

    end

    return price

  end

  def all_cost(order)

    total_price(current_cart) + order.shipping_cost

  end

end
