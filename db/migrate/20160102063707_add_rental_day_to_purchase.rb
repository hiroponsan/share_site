class AddRentalDayToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :rental_day, :integer
  end
end
