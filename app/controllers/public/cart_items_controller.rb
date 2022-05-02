class Public::CartItemsController < ApplicationController

  def index

    @cart_items = CartItem.where(customer:current_customer)

  end

  # ストロングパラメータ
  private

  def cart_item_params

    params.require(:cart_item).permit(:item_id, :amount)

  end

end
