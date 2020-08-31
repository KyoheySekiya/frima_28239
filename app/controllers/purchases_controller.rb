class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase = Purchase.new(price: purchase_params[:price])
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_439cbe7891b5e8e0a997de56"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
