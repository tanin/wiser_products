class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 32, too_long: "%{count} characters is the maximum allowed" }
  validates :sku, presence: true, uniqueness: true, length: { maximum: 6, too_long: "%{count} characters is the maximum allowed" }
  validates :category, presence: true, length: { maximum: 10, too_long: "%{count} characters is the maximum allowed" }
end
