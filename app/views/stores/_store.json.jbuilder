json.extract! store, :id, :product_name, :product_type, :price, :description, :brand, :created_at, :updated_at
json.url store_url(store, format: :json)
