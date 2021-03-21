class WelcomeController < ApplicationController
  def index
    if current_user.present?
      if current_user.goals.blank?
        redirect_to new_goal_path
      else
        redirect_to goal_path(current_user.goals.last)
      end
    end
  end
end
