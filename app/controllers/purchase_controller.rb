class PurchaseController < ApplicationController

  def index
    @donation = Donation.new
    @item = Item.find(params[:item_id])  
  end
  
  def create
    
    @donation = Donation.new(donation_params)
    @item = Item.find(params[:item_id])
    if @donation.valid?
      pay_item
      @donation.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price], 
      card: params[:token],    
      currency:'jpy'
    )
  end
 
  def donation_params
    params.require(:donation).permit(:postal,:prefecture_id,:city,:number,:phone,:build).merge(item_id:params[:item_id],user_id:current_user.id,token:params[:token])
    
  end
end
