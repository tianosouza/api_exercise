FactoryBot.define do
  factory :exercise_set do
    reps { 10 }
    duration { 30 }
    association :workout_exercise
  end
end
