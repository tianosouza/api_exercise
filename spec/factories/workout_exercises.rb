FactoryBot.define do
  factory :workout_exercise do
    workout
    exercise

    reps { 10 }
  end
end
