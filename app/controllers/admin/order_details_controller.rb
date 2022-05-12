class Admin::OrderDetailsController < ApplicationController

  before_action :authenticate_admin!

  def update

    @order_detail = OrderDetail.find(params[:id])

    @order_detail.update(order_detail_params)

    @order = @order_detail.order

    # 製作ステータスを[製作中(2)],注文ステータスを[製作中(2)]
    if @order_detail.make_status == "製作中"

      @order.update(order_status: 2)

      flash[:notice] = "ステータスを更新しました。"

      @order.save

    end

  end

  # ストロングパラメータ

  def order_detail_params

    params.require(:order_detail).permit(:order_id, :make_status, :amount)

  end


end
