class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, limit: '32'
      t.timestamps
    end

    add_reference :products, :category, index: true, foreign_key: true
    remove_column :products, :category
  end
end
