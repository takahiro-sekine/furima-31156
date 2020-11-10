class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.all.order(id: 'DESC')
  end

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

  def show
  end

  def edit
    redirect_to action: :index unless current_user.id == @item.user_id
  end

  def update
    if @item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @prototype.user_id
      @item.destroy
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def items_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :status_id, :burden_id, :price, :source_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
