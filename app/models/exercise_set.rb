class ExerciseSet < ApplicationRecord
  belongs_to :workout_exercise

  validates :reps, presence: true
  validates :reps, numericality: { only_integer: true }, allow_blank: true
  validates :duration, presence: true
end
