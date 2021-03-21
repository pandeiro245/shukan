class WelcomeController < ApplicationController
  def index
    redirect_to new_goal_path if session[:user_id].present?
  end
end
