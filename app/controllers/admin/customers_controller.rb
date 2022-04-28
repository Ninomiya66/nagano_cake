class Admin::CustomersController < ApplicationController

  def index

    @customers = Customer.all

  end

  def show

    @customer = Customer.find(params[:id])

  end

  def edit

    @customer = Customer.find(params[:id])

  end

  def update

    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)

      flash[:notice] = "会員情報更新"

      redirect_to admin_customer_path

    else

      render 'edit'

    end

  end

    # ストロングパラメータ
    private

    def customer_params

      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :telephone_number,:address, :is_active)

    end

end
