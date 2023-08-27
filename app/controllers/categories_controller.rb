class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show update destroy]

  def index
    @user = current_user
    @categories = Category.where(user_id: @user.id)
  end

  def show
    @category = Category.find(params[:id])
    @items = @category.items.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category added successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: 'Category removed successfully'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
