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
  )
  user.save!
end


10.times do |i|
 Stock.create!(
  title:   "task_#{i + 1}",
  content:  "task_content_#{i + 1}",
  deadline:  DateTime.now + 10,
  status: = ["0","1","2"]
  priority: rand(3),
  user_id: = rand(1..10)
)
end
