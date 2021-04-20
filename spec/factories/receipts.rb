FactoryBot.define do
  factory :receipt do
    shop_name   { 'test_shop_name1' }
    item_detail { 'test_item_detail1' }
    price       { '100' }
    image       { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    memo        {'test_memo'}
  # アソシエーション
    association :user
  end

  factory :second_receipt, class: Receipt do
    shop_name   { 'test_shop_name2' }
    item_detail { 'test_item_detail2' }
    price       { '120' }
    image       { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    memo        {'test_memo2'}

    association :user
  end
end
