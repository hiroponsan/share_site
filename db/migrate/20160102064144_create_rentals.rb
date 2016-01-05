class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :product_id
      t.integer :user_id
      t.integer :rental_day

      t.timestamps null: false
    end
  end
end
