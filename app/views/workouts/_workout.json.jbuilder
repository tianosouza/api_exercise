json.extract! workout, :id, :user_id, :title, :description, :created_at, :updated_at
json.url workout_url(workout, format: :json)
