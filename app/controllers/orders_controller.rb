class OrdersController < ApplicationController
  before_action :order_index, only: [:index,:create]

  def index
    #@item = Item.find(params[:item_id,])
    @order_shared = OrderShared.new
  end

  # def new

  # end

  def create
    #binding.pry
    @order_shared = OrderShared.new(order_params)
    if @order_shared.valid?
      @order_shared.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:item_id,:postal_code,:prefecture_id,:city,:addresses,:building,:phone_number).merge(user_id: current_user.id)
   end

   def order_index
   @item = Item.find(params[:item_id,])
   end
end
