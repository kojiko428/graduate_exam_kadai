class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :item_genre
      t.string :item_name
      t.text :content
      t.integer :price
      t.string :image
      t.integer :number_of_stock

      t.timestamps
    end
  end
end
