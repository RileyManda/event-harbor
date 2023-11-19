json.extract! event, :id, :name, :description, :images, :avatar , :banner, :reserved, :visibility, :created_at, :updated_at
json.url event_url(event, format: :json)
