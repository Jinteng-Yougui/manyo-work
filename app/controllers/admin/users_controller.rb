class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def index
    if current_user.admin?
      redirect_to admin_users_path
    else
      @users = User.includes(:tasks)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "編集しました。"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "削除しました。"
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
