class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def restrict_access
    if !current_user
      flash[:alert] = "You must log in."
      redirect_to new_session_path
    end
  end

  def admin_access
    unless current_user && current_user.admin
      redirect_to root_path, alert: "YOU ARE NOT ADMIN!!!"
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin
  end

  helper_method :current_user, :current_admin?
  
end
