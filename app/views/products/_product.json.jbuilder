json.extract! product, :id, :name, :price, :parcels, :url, :created_at, :updated_at
json.url product_url(product, format: :json)
