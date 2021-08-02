class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
