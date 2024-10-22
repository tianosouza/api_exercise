class Workout < ApplicationRecord
  belongs_to :user

  has_many :workout_exercises, dependent: :destroy
  has_many :exercises, through: :workout_exercises

  validates :title, presence: true
  validates :description, presence: true
end
