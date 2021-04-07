class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :type
      t.string :name
      t.text :description
      t.decimal :price
      t.string :sku
      t.integer :stock

      t.timestamps
    end
  end
end
