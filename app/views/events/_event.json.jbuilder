json.extract! event, :id, :start_date, :start_time, :end_date, :end_time, :address, :details, :photo, :status, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)
