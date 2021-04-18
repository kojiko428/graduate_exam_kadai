class Stock < ApplicationRecord
  validates :item_name, presence: true
  validates :content, presence: true

  validates :item_name, length: { in: 1..30 }
  validates :content, length: { in: 1..140 }
  # 0以上の正の数のみ
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :number_of_stock, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  # carrierwave用の設定
  mount_uploader :image, ImageStockUploader

  belongs_to :user

  enum item_genre: { '洗濯用品': 0, '掃除用品': 1, 'バス用品': 2, 'トイレ用品': 3, '家庭日用品': 4, 'その他': 5}


end
