class Comment < ApplicationRecord
  validates :content, presence: true
  validates :content, length: { in: 1..30 }
  belongs_to :receipt
end
