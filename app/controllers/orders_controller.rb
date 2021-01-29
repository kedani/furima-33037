class OrdersController < ApplicationController
  before_action :order_index, only: [:index,:create]

  def index
    #@item = Item.find(params[:item_id,])
    @order_shared = OrderShared.new
  end

  # def new

  # end

  def create
    @order_shared = OrderShared.new(order_params)
    if @order_shared.valid?
      pay_item
      @order_shared.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    #binding.pry
    params.permit(:item_id,:postal_code,:item_prefecture_id,:city,:addresses,:building,:phone_number).merge(user_id: current_user.id,token: params[:token])
   end

   def order_index
   @item = Item.find(params[:item_id,])
   end

   def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.item_price,
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
   end
end
