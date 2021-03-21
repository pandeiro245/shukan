class WelcomeController < ApplicationController
  def check
    if current_user.present?
      if current_user.goals.blank?
        redirect_to new_goal_path
      elsif current_user.yet?
        redirect_to goal_path(current_user.goals.last)
      else
        redirect_to events_path
      end
    else
      redirect_to '/welcome'
    end
  end

  def index
  end
end
