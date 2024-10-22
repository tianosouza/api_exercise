require 'rails_helper'

RSpec.describe WorkoutExercise, type: :model do
  describe 'associations' do
    it { should belong_to(:workout) }
    it { should belong_to(:exercise) }
  end

  describe 'validations' do
    subject { build(:workout_exercise) }
    it { should validate_presence_of(:sets) }
    it { should validate_numericality_of(:sets).only_integer.is_greater_than(0) }

    it { should validate_presence_of(:reps) }
    it { should validate_numericality_of(:reps).only_integer.is_greater_than(0) }
  end
end
