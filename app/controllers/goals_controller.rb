class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = session[:user_id]
    if @goal.save
      current_user.goal_id = @goal.id
      current_user.goal_updated_at = Time.zone.now
      current_user.save!
      redirect_to @goal, notice: "Goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if goal_params[:done].present? && current_user.yet?
      event = Event.find_or_initialize_by(
        date_on: Util.now.to_date,
        goal: @goal
      )
      event.save!
      redirect_to events_path
    elsif goal_params[:again].present?
      current_user.goal_id = @goal.id
      current_user.goal_updated_at = Time.zone.now
      current_user.save!
      redirect_to @goal
    end
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:name, :category_id, :done, :again)
    end
end

