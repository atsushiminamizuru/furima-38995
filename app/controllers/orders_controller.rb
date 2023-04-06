class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(
      :postal_code,
      :item_prefecture_id,
      :city,
      :addresses,
      :building,
      :phone_number
    ).merge(
      item_id: params[:item_id],
      user_id: current_user.id
    )
  end
end
