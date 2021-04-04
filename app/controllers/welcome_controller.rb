class WelcomeController < ApplicationController
  def check
    if current_user.present?
      case current_user.status
      when 'no goal'
        redirect_to new_goal_path
      when 'yet'
        redirect_to goal_path(current_user.goal)
      when 'done'
        redirect_to events_path
      end
    else
      redirect_to '/welcome'
    end
  end

  def index
  end
end
