class Stock < ApplicationRecord
  validates :item_name, presence: true
  validates :content, presence: true

  validates :item_name, length: { in: 1..30 }
  validates :content, length: { in: 1..140 }
  # carrierwave用の設定
  mount_uploader :image, ImageUploader
end
