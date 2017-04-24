class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user) if !authenticate_admin
    @users = User.where.not(id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.avatar = params[:user][:avatar]
    if @user.save
      redirect_to @user
    end
  end

  def destroy

  end

  def block
    @user = User.find(params[:id])
    @user.banned = true
    @user.save
  end

  def unblock
    @user = User.find(params[:id])
    @user.banned = false
    @user.save
  end

  private

  def user_params
    params.require(:users).permit!
  end


end
