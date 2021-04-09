FactoryBot.define do
  factory :stock do
    # 下記の内容は実際に作成するカラム名に合わせて変更してください
    item_genre { 'test_genre' }
    item_name { 'test_name' }
    content   { 'test_content' }
    price     { '100' }
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    number_of_stock  { '1' }
  end

  factory :second_stock, class: Stock do
    item_genre { 'test_genre2' }
    item_name { 'test_name2' }
    content   { 'test_content2' }
    price     { '200' }
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    number_of_stock  { '2' }
  end

end
