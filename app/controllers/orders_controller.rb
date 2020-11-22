class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      @order_address.save
      redirect_to action: :index
    else
       render "index"
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id  )
  end

  def order_params
    # params.require(:order).permit(:price).merge(token: params[:token])
  end

  # def pay_item
  # Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
  # Payjp::Charge.create(
  # amount: order_params[:price],  # 商品の値段
  # card: order_params[:token],    # カードトークン
  # currency: 'jpy'                 # 通貨の種類（日本円）
  # )
  # end
end