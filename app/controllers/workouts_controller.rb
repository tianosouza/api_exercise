class WorkoutsController < ApplicationController
  before_action :set_workout, only: %i[ show update destroy ]

  def index
    @workouts = Workout.all
    render json: @workouts
  end

  def show
  end

  def create
    @workout = Workout.new(workout_params)

    if @workout.save
      render :show, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def update
    if @workout.update(workout_params)
      render :show, status: :ok, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy!
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:user_id, :title, :description)
  end
end
