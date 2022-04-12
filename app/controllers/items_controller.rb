class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end

  def update
    if @item.update(items_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id
    redirect_to root_path
  end

  private

  def items_params
    params.require(:item).permit(:items_name, :items_comments, :price, :category_id, :condition_id, :shipping_price_id,
                                 :shipping_area_id, :shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
