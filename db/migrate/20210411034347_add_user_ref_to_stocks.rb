class AddUserRefToStocks < ActiveRecord::Migration[5.2]
  def change
    add_reference :stocks, :user, foreign_key: true
  end
end
