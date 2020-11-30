class PurchaseController < ApplicationController
  before_action :params_find, only: [:index,:create]
  before_action :authenticate_user!

  def index
    @purchase = PurchaseShippingForm.new
    if current_user.id == @item.user_id || @item.purchase!=nil
      redirect_to root_path
    end
  end
  
  def create
    
    @purchase = PurchaseShippingForm.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price], 
      card: params[:token],    
      currency:'jpy'
    )
  end
 
  def params_find
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_shipping_form).permit(:postal,:prefecture_id,:city,:number,:phone,:build).merge(item_id:params[:item_id],user_id:current_user.id,token:params[:token])
    
  end
end
