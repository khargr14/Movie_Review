json.extract! suggestion, :id, :title, :description, :movie_img, :comment, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)
