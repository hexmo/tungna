class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :category
      t.string :brand

      t.timestamps
    end
  end
end
