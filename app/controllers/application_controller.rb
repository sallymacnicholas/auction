class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :admin?, :authorize_admin

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def admin?
    current_user && current_user.admin?
  end

  def authorize_admin
    return if admin?
    redirect_to browse_path
  end
end
