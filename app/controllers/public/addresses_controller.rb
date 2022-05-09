class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index

    @addresses = current_customer.addresses

    @address = Address.new

  end

  def create

    @address = Address.new(address_params)

    @address.customer_id = current_customer.id

    @addresses = current_customer.addresses

    if @address.save

      flash[:notice] = "新規配送先を登録しました。"

      redirect_to addresses_path

    else

      flash[:alert] = "登録情報に不備があります。"

      redirect_to addresses_path

    end

  end

  def edit

    @address = Address.find(params[:id])

  end

  def update

    @address = Address.find(params[:id])

    if @address.update(address_params)

      flash[:notice] = "新規配送先を登録しました"

      redirect_to addresses_path

    else

      render "edit"

    end

  end

  def destroy

    @address = Address.find(params[:id])

    @address.destroy

    @addresses = current_customer.address

    flash[:alert] = "配送先を削除しました。"

    redirect_to addresses_path

  end



  # ストロングパラメータ
  private

  def address_params

    params.require(:address).permit(:postal_code, :address, :name)

  end

end