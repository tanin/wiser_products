class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 32, too_long: "%{count} characters is the maximum allowed" }
  validates :sku, presence: true, uniqueness: true, length: { maximum: 6, too_long: "%{count} characters is the maximum allowed" }
  belongs_to :category

  scope :by_category, ->(id){ where(category_id: id) }
end
