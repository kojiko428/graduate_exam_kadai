class Receipt < ApplicationRecord
  # carrierwave用の設定
  mount_uploader :image, ImageUploader

  belongs_to :user
end
