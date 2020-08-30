class ItemsController < ApplicationController
  
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
      #  redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_date_id, :price, images: []).merge(user_id: current_user.id)
  end
end
