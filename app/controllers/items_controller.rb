class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]
 # def index
  #  @items = Item.all
  #end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def items_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :status_id, :burden_id, :price, :source_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end
