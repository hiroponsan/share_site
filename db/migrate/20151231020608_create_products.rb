class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price_per_day
      t.integer :minimum_rental_day
      t.integer :maximum_rental_day
      t.text :discription

      t.timestamps null: false
    end
  end
end
