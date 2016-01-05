class AddAdressToUser < ActiveRecord::Migration
  def change
    add_column :users, :adress, :text
    add_column :users, :nickname, :string
  end
end
