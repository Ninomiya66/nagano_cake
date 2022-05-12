class Admin::OrdersController < ApplicationController

  before_action :authenticate_admin!

  def show

    @order = Order.find(params[:id])

    @order_details = @order.order_details

  end

  def update

    @order = Order.find(params[:id])

    @order.update(order_params)

    flash[:notice] = "ステータスを更新しました。"

    redirect_to admin_order_path(@order)

     if @order_status == "入金確認"

      @order.order_details.each do |order_detail|

        order_detail.update(make_status: 1)

      end

     end

  end

  # ストロングパラメータ
  def order_params

    params.require(:order).permit(:price_total, :postage, :postal_code, :address, :name, :payment_method, :order_status, :make_status)

  end

end
