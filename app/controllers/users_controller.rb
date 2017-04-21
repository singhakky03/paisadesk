class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user) if !authenticate_admin
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy

  end

  private

  def user_params
    params.require(:users).permit!
  end


end
