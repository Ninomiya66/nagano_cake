class Admin::SearchsController < ApplicationController

  before_action :authenticate_admin!

  def search

    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    @records = search_for(@model, @content, @method)

  end

  private

  def search_for(model, content, method)

    if model == "customer"

      if method == "perfect"

        Customer.where(name: content)

      else

        Customer.where('name LIKE ?' '%'+content+'%')

      end

    elsif model == 'item'

      if method == 'perfect'

        Item.where(name: content)

      else

        Item.where('name LIKE ?', '%'+content+'%')

      end

    end

  end

end