FactoryBot.define do
  factory :stock do
    item_genre { '洗濯用品' }
    item_name { 'test_name' }
    content   { 'test_content' }
    price     { '100' }
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    number_of_stock  { '1' }
    association :user
  end

  factory :second_stock, class: Stock do
    item_genre { 'バス用品' }
    item_name { 'test_name2' }
    content   { 'test_content2' }
    price     { '200' }
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    number_of_stock  { '2' }
    association :user
  end

end

#
# ["洗濯用品", "0"]
# ["掃除用品", "1"]
# ["バス用品", "2"]
# ["トイレ用品", "3"]
# ["家庭日用品", "4"]
# ["その他", "5"]
