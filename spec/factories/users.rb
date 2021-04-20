FactoryBot.define do
  factory :user, class: User do
    username { "user1" }
    # email { "user1@example.com" }
    sequence(:email) { |n| "1tester#{n}@example.com" }
    password { "password1" }
    password_confirmation {"password1"}
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end

  factory :second_user, class: User do
    username { "user2" }
    # email { "user2@example.com" }
    sequence(:email) { |n| "2tester#{n}@example.com" }
    password { "password2" }
    password_confirmation {"password2"}
    image     { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
  end
end
