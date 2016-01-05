class AddRentalIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :rental_id, :integer
  end
end
