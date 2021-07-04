class EventsController < ApplicationController
  def index
    redirect_to goal_path(current_user.goals.last) if current_user.yet?
    @events = Event.includes(:goal).order('id desc').limit(50)
    today = Time.zone.now.to_date
    start_date = today.beginning_of_week
    end_date = today.end_of_week
    @current_week_events = current_user.goal.events.where(date_on: start_date..end_date).map { |event| [event.date_on.strftime('%a'), event] }.to_h
  end
end

