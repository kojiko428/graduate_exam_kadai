class Receipt < ApplicationRecord
  validates :shop_name, presence: true
  validates :item_detail, presence: true
  # validates :memo, presence: true
  # 1以上の正の数のみ
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  validates :shop_name, length: { in: 1..30 }
  validates :item_detail, length: { in: 1..30 }

  # carrierwave用の設定
  mount_uploader :image, ImageReceiptUploader

  belongs_to :user
  has_many :comments, dependent: :destroy
end
