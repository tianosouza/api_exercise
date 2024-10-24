Rails.application.routes.draw do
  resources :workouts
  resources :users, only: [ :create, :index ]
  post "/sign_in", to: "users#sign_in"
end
