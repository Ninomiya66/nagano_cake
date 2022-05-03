class Public::OrdersController < ApplicationController

   before_action :authenticate_customer!

  def new

    @order = Order.new

    @addresses = current_customer.addresses

  end

  def confirm

    cart_items current_customer.cart_items


    @order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method])

    @order.price_total = billing(@order)

    # my_addressに1（自宅）
    if params[:order][:my_address] == "1"

      @order.postal_code = current_customer.postal_code

      @order.address = current_customer.address

      @order.name = full_name(current_customer)

    # my_addressに2（配送先一覧）
    elsif params[:order][:my_address] == "2"

      ship = Address.find(params[:order][:address_id])

      @order.postal_code = ship.postal_code

      @order.address = ship.address

      @order.name = ship.name

    # my_addressに3(新配送先)
    elsif params[:order][:my_address] == "3"

      @order.postal_code = params[:order][:postal_code]

      @order.address = params[:order][:address]

      @order.name = params[:order][:name]

      @ship = "1"

    # 有効かどうかの確認
      unless @order.valid? == true

        @addresses = Address.where(customer: current_customer)

        render :new

      end

    end

  end

  def create

    @order = current_customer.orders.new(order_params)

    @order.save

    # 新規の場合保存
    if params[:order][:ship] == "1"

      current_customer.address.create(address_params)

    end

    # カートの中身の情報を注文履歴へ
    @cart_items = current_customer.cart_items

    @cart_items.each do |cart_item|

      @order_detail = OrderDetail.new

      @order_detail.item_id = cart_item.item_id

      @order_detail.order_id = @order.id

      @order_detail.count = cart_item.count

      @order_detail.price = cart_item.item.price * cart_item.count

      @order_detail.save

    end

    # カート内削除
    @cart_items.destroy_all

    redirect_to complete_orders_path

  end

  def complete

  end

  def index

    @orders = current_customer.orders

  end

  def show

    @order = Order.find(params[:id])

    @order_details = @order.order_details

  end

  private

  def order_params

    params.require(:order).permit(:postal_code, :address, :name, :payment_method, :total_payment)

  end

  def address_params

    params.require(:order).permit(:postal_code, :address, :name)

  end

end
