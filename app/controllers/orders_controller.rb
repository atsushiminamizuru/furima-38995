class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
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
      user_id: current_user.id,
      token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).item_price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
