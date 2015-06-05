class Category < ActiveRecord::Base
  has_many :products, inverse_of: :category
  validates :name, presence: true, length: { maximum: 32, too_long: "%{count} characters is the maximum allowed" }
end
