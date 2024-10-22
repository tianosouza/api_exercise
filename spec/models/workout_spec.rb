require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:workout_exercises).dependent(:destroy) }
    it { should have_many(:exercises).through(:workout_exercises) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

  describe 'database columns' do
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:user_id).of_type(:integer) }
  end

  describe 'factory' do
    it 'has a valid factory' do
      expect(build(:workout)).to be_valid
    end
  end
end
