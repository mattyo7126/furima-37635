class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end  

  def new
   @item = Item.new
  end  

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else  
      render :new
    end  
  end  

  private

  def items_params
    params.require(:item).permit(:items_name, :items_comments, :price, :category_id, :condition_id, :shipping_price_id, :shipping_area_id, :shipping_date,:image).merge(user_id: current_user.id)
  end
end
