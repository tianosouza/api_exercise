FactoryBot.define do
  factory :user do
    first_name { |n| "Fulano_#{n}" }
    last_name { "Exercise" }
    sequence(:username) { |n| "fulano_#{n}00" }
    sequence(:email) { |n| "fulano_#{n}00@exercise.com" }
    password { "12345678900" }
    password_confirmation { "12345678900" }
  end
end
