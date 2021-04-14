class ChangeDatatypeItemGenreOfStocks < ActiveRecord::Migration[5.2]
  def change
    change_column :stocks, :item_genre, 'integer USING CAST(item_genre AS integer)'
  end
end
