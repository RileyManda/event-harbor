json.extract! participant, :id, :name, :email, :event_id, :attending, :created_at, :updated_at
json.url participant_url(participant, format: :json)
