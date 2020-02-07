json.extract! event, :id, :title, :description, :day, :time, :user_id, :month_day, :month_direction, :created_at, :updated_at
json.url event_url(event, format: :json)
