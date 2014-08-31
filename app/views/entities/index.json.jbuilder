json.array!(@entities) do |entity|
  json.extract! entity, :id, :name, :type, :lat, :lon, :description, :url, :address, :year_estab, :user_id
  json.url entity_url(entity, format: :json)
end
