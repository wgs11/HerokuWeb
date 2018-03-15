json.extract! hero, :id, :name, :total, :unlocks, :image_url, :created_at, :updated_at
json.url hero_url(hero, format: :json)
