require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'associations' do
    it { should belong_to(:workout) }
    it { should have_many(:workout_exercises).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:exercise) }

    it { should validate_presence_of(:exercise_name) }
    it { should validate_presence_of(:exercise_instruction) }
    it { should validate_inclusion_of(:exercise_type).in_array(%w[A B C D]).allow_nil }
  end
end
