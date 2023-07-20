class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  def login_required
    redirect_to new_session_path unless current_user
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  def set_current_user
    @current_user = User.find_by(id :session[:user_id])
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "ログイン済です"
      redirect_to("/tasks/index")
    end
  end
end
