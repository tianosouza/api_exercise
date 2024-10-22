FactoryBot.define do
  factory :exercise do
    association :workout
    exercise_name { "Squat" }
    exercise_type { "A" }
    exercise_instruction { "instrucion" }
  end
end
