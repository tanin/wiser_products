class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: '32'
      t.string :sku, limit: '6'
      t.string :category, limit: '10'

      t.timestamps
    end
  end
end
