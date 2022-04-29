class Public::ItemsController < ApplicationController

  def index

    @items =Item.all

    @total = Item.all

  end

  def show

    @item = Item.find(params[:id])

  end

  # ストロングパラメータ
  private

  def item_params

    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)

  end

end