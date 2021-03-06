class Public::ItemsController < ApplicationController

  def index

    @items =Item.page(params[:page])

    @total = Item.all

  end

  def show

    @item = Item.find(params[:id])

    @cart_item = CartItem.new

  end

  # ストロングパラメータ
  private

  def item_params

    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)

  end

end