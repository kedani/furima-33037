class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :select_item, only: [:show,:edit,:update,:destroy]
  before_action :root_jump, only: [:destroy,:edit,:update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
   if  @item.destroy
     redirect_to root_path
   else
     render :show
   end
  end

  private

  def item_params
   params.require(:item).permit(:image,:item_name,:item_info,:item_category_id,:item_sales_status_id,:item_shipping_fee_status_id,:item_prefecture_id,:item_scheduled_delivery_id,:item_price).merge(user_id: current_user.id)
  end
  def select_item
    @item = Item.find(params[:id])
   end
   def root_jump
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end
end

