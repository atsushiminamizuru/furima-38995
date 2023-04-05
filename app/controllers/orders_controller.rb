class OrdersController < ApplicationController
  def index
    @order = Order.new
    @address = Address.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).merge(
      token: params[:token],
      item_id: params[:item_id],
      user_id: current_user_id
    )
  end
end
