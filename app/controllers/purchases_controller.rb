class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
    if @item.user
      redirect_to root_path
    end
    if @item.purchase 
        redirect_to root_path
    end

  end
  
  def new
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchase_params
    params.permit(:postal_code, :prefecture, :city, :address, :building, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
