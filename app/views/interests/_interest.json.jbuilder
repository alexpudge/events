json.extract! interest, :id, :user_id, :event_id, :response, :created_at,
              :updated_at
json.url interest_url(interest, format: :json)
