class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end  
 
  def create
   @order = Order.create(order_params)
   @address = Address.create(address_params)
   
  end  
  private

  def order_params
    params.require(:order).permit().merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(order_id: @order.id)
end
