class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :matching_login_user, only: [:edit, :update, :destroy]
  before_action :sold_out_item, only: [:edit, :update, :destroy]
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
    @items = Item.includes(:user).order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
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

  def matching_login_user
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def sold_out_item
    @item = Item.find(params[:id])
    redirect_to root_path if @item.order.present? 
  end
end
