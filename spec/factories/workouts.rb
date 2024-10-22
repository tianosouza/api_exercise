FactoryBot.define do
  factory :workout do
    association :user
    title { "Sample Workout" }
    description { "Description of the workout." }
  end
end
