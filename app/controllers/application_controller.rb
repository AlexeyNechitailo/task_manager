class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :check_authorization

  def current_user
    session[:user_id].nil? ? User.new : User.find(session[:user_id])
  end

  def check_authorization
    redirect_to root_path if current_user.guest?
  end

end
