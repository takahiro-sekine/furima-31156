class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :set_item, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item[:price], # 商品の値段
      card: address_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
