json.array!(@rentals) do |rental|
  json.extract! rental, :id, :product_id, :user_id, :rental_day
  json.url rental_url(rental, format: :json)
end
