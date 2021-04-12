class CreateReceipts < ActiveRecord::Migration[5.2]
  def change
    create_table :receipts do |t|
      t.string :shop_name
      t.string :item_detail
      t.text :memo
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
