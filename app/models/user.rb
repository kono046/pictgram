class User < ApplicationRecord
  validates :name, presence: true
  #名前の長さに１５文字までの制限
  validates :name, length: { maximum: 15}
  
  #メアドの正規表現
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  
  #半角6~12文字で英大文字・英小文字・数字それぞれ１文字以上含む
VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
  validates :password, presence: true
  #パスワードの文字数制限
  validates :password, length: { in: 8..32}
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
end