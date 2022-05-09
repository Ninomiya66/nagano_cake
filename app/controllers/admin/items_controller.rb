class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def index

    @items = Item.page(params[:page])

  end

  def new

    @item = Item.new

  end

  def create

    @item = Item.new(item_params)

    if @item.save

      flash[:notice] = "商品の新規登録完了"

      redirect_to admin_item_path(@item)

    else

      flash[:notice] = "登録内容に不備があります"

      render :new

    end

  end

  def show

    @item = Item.find(params[:id])

  end

  def edit

    @item = Item.find(params[:id])

  end

  def update

    @item = Item.find(params[:id])

    if @item.update(item_params)

      flash[:notice] = "商品詳細編集完了"

      redirect_to admin_item_path(@item)

    else

      flash[:notice] = "編集内容に不備があります"

      render :edit

    end

  end

  # ストロングパラメータ
  private

  def item_params

    params.require(:item).permit(:image, :genre_id, :name, :introduction, :price, :is_active)

  end

end
