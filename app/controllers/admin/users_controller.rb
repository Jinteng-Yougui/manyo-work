class Admin::UsersController < ApplicationController
  before_action :set_user
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def destroy
    @user.destroy
  end
end
