class Exercise < ApplicationRecord
  has_many_attached :exercise_media
  belongs_to :workout

  has_many :workout_exercises, dependent: :destroy

  validates :exercise_name, presence: true
  validates :exercise_type, inclusion: { in: %w[A B C D], allow_nil: true }
  validates :exercise_instruction, presence: true
end
