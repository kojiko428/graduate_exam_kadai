class Stock < ApplicationRecord
  validates :item_name, presence: true
  validates :content, presence: true

  validates :item_name, length: { in: 1..30 }
  validates :content, length: { in: 1..140 }
  # carrierwave用の設定
  mount_uploader :image, ImageStockUploader

  belongs_to :user

  enum item_genre: { '洗濯用品': 0, '掃除用品': 1, 'バス用品': 2, 'トイレ用品': 3, '家庭日用品': 4, 'その他': 5}
end
