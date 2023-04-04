class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    # item = Item.find(params[:id])
    # redirect_to root_path unless current_user.id == item.user_id
    # item.destroy
    # redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :item_info, :item_price,
      :item_category_id,
      :item_sales_status_id,
      :item_shipping_fee_status_id,
      :item_prefecture_id,
      :item_scheduled_delivery_id
    ).merge(user_id: current_user.id)
  end
end
