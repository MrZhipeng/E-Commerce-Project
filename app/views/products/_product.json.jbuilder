json.extract! product, :id, :name, :description, :price, :on_sale_price, :created_at, :updated_at
json.url product_url(product, format: :json)
