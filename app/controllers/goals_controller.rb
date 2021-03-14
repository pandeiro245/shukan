class GoalsController < ApplicationController
  before_action :set_goal, only: %i[ show edit update destroy ]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = session[:user_id]
    @goal.category_id = 1
    if @goal.save
      redirect_to @goal, notice: "Goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:name)
    end
end

