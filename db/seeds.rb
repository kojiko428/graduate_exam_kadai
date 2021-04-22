# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |index|
  no = index + 1
  user = User.create(
    name:           "user_#{no}",
    email:  "email_#{no}@example.com",
    password:               "#{no}password#{no}",
    password_confirmation: "#{no}password#{no}",
    image: File.open('./app/assets/images/default.png')
  )
  user.save!
end

15.times do |i|
  Stock.create!(
    item_genre: rand(6),
    item_name:   "item_name_#{i + 1}",
    content:  "item_content_#{i + 1}",
    price: '120',
    image: File.open('./app/assets/images/default_stock_receipt.png')
    number_of_stock: '1',
    user_id: rand(1..10)
  )
  stock.save!
end

15.times do |i|
  Receipt.create!(
    shop_name: "shop_name_#{i + 1}",
    item_detail: "item_detail_#{i + 1}",
    price: '120',
    image: File.open('./app/assets/images/default_stock_receipt.png')
    memo:      "receipt_memo_#{i + 1}"
    user_id: rand(1..10)
  )
  stock.save!
end
