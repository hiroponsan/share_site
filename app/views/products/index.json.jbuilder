json.array!(@products) do |product|
  json.extract! product, :id, :name, :price_per_day, :minimum_rental_day, :maximum_rental_day, :discription
  json.url product_url(product, format: :json)
end
