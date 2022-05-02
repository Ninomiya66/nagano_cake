module ApplicationHelper

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

end
