class OrdersController < ApplicationController
  def index
    @item = Item.new
  end  
end
