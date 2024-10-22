require 'rails_helper'

RSpec.describe ExerciseSet, type: :model do
  describe 'associations' do
    it { should belong_to(:workout_exercise) }
  end

  describe 'validations' do
    subject { build(:exercise_set) }

    it { should validate_presence_of(:reps) }
    it { should validate_numericality_of(:reps).only_integer.allow_nil }
  end
end
