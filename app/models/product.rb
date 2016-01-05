class Product < ActiveRecord::Base
   has_attached_file :image, styles: { large: "500x500>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :user
  has_many :rentals
end
