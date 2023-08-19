class ItemsController < ApplicationController
  before_action :set_category
  before_action :set_item, only: %i[show update destroy]

  def index
    @items = @category.items.order(created_at: :desc)
    @total_amount = @items.sum(:amount)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.category = @category
    @item.user = current_user
    @item.author = current_user

    if @item.save
      redirect_to category_items_path(@category), notice: 'Item added successfully'
    else
      render :new, alert: 'Failed to add item'
    end
  end

  def destroy
    if @item.destroy
      redirect_to category_items_path(@category), notice: 'Item removed successfully'
    else
      render :index, alert: 'Failed to remove item'
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
