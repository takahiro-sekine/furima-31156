class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :kana_first_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :kana_last_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :nickname, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
