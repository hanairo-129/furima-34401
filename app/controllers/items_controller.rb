class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:edit, :show]

  
  def index
    @items = Item.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :details, :category_id, 
      :status_id, :delivery_id, :area_id, :post_time_id, :price, 
      :image).merge(user_id: current_user.id)
  end

  def set_item

    @item = Item.find(params[:id])

    if current_user.nil?
      redirect_to user_session_path
    end

    if user_signed_in?
      if current_user.id != @item.user.id
        redirect_to root_path
      end
    end
  end
end
