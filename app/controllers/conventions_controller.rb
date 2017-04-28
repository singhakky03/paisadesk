class ConventionsController < ApplicationController

  before_action :set_select_collection, only: [:new, :create]

  def index
    @user = User.find(params[:user_id])
    @conventions = @user.conventions
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @convention = Convention.new
  end

  def create
    @user = User.find(params[:user_id])
    @convention = @user.conventions.create(convention_params)
    if @convention.errors.present?
      render :template => 'conventions/new'
    else
      redirect_to user_path(@user)
    end
  end

  private

  def convention_params
    params.require(:convention).permit!
  end

  def set_select_collection
    @categories = current_user.categories
  end

end
