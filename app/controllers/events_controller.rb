class EventsController < ApplicationController
  def index
    redirect_to goal_path(current_user.goals.last) if current_user.yet?
    @events = Event.order('id desc').limit(50)
  end
end

