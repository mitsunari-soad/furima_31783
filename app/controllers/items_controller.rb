class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :params_find, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.order('created_at DESC')
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
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy || current_user.id != @item.user_id
      redirect_to root_path 
    end
  end

  private

  def params_find
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :status_id, :category_id, :burden_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
