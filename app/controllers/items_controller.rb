class ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  def update
    Item.find(params[:id]).update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :delivery_fee_id, :ship_from_location_id, :delivery_date_id, :price, images: []).merge(user_id: current_user.id)
  end
end
