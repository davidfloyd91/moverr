json.extract! feedback, :id, :review_id, :user_id, :content, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
