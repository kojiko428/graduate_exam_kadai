class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable , :validatable

  # 登録パスワードのバリデーション
  VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  #
  validates :username,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_PASSWORD_REGIX  }
  # before_validation { email.downcase! }
  # has_secure_password

  validates :password, presence: true, length: { minimum: 6 } , on: :create

  has_many :stocks
  has_many :receipts

  mount_uploader :image, ImageUploader

end
