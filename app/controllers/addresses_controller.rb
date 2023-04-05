class AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render "orders/index"
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :postal_code, :item_prefecture_id, :city,
      :addresses, :building, :phone_number
    ).merge(order_id: params[:order_id])
  end
end
