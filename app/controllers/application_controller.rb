class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    session[:user_id].nil? ? User.new : User.find(session[:user_id])
  end

end
