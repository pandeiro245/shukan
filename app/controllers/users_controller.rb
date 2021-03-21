class UsersController < ApplicationController
  def login_with_token
    token = params[:token]
    user_id = params[:user_id]
    user = User.find_by(
      id: user_id,
      token: token
    )
    raise 'invalid token' if user.blank?
    session[:user_id] = user.id
    redirect_to '/'
  end
end
