class ItemsController < ApplicationController
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    authenticate_user!
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

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :status_id, :category_id, :burden_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
