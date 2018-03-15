json.extract! donation, :id, :progress, :total, :incentive, :image_url, :created_at, :updated_at
json.url donation_url(donation, format: :json)
