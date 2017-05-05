class CategoriesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @category = Category.new
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.create(category_params)
    if @category.errors.present?
      render :template => 'categories/new'
    else
      redirect_to user_path(@user)
    end
  end

  def index
    @user = User.find(params[:user_id])
    @categories = @user.categories
  end

  def show
  end

  private

  def category_params
    params.require(:category).permit!
  end

end
