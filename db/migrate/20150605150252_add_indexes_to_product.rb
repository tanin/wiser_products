class AddIndexesToProduct < ActiveRecord::Migration
  def change
    add_index :products, :name
    add_index :products, :sku
    add_index :products, :category
  end
end
