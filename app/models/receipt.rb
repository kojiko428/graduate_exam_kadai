class Receipt < ApplicationRecord
  validates :shop_name, presence: true
  validates :item_detail, presence: true
  # validates :memo, presence: true
  validates :price, presence: true

  validates :shop_name, length: { in: 1..30 }
  validates :item_detail, length: { in: 1..30 }

  # carrierwave用の設定
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
end
