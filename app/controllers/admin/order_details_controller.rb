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

    # 注文個数と製作済みの個数が同じなら
    if @order.order_details.amount == @order.order_details.where(make_status: 3).amount

      @order.update(order_status: 3)

      flash[:notice] = "ステータを更新しました。"

      @order.save

    end

    redirect_to request.referer

  end

  # ストロングパラメータ

  def order_detail_params

    prams.require(:order_detail).permit(:order_id, :make_status, :amount)

  end


end
