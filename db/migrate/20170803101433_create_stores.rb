class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :product_name
      t.string :product_type
      t.decimal :price
      t.text :description
      t.string :brand

      t.timestamps
    end
  end
end
