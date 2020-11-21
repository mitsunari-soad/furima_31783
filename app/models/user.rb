class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/, message:"全角（漢字・ひらがな・カタカナ）での入力が必須"}
  validates :last_name, presence: true, format: {with:/\A[ぁ-んァ-ン一-龥]/, message:"全角（漢字・ひらがな・カタカナ）での入力が必須"}
  validates :first_yomigana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/, message:"フリガナは、全角（カタカナ）での入力が必須"}
  validates :last_yomigana, presence: true, format: {with:/\A[ァ-ヶー－]+\z/, message:"フリガナは、全角（カタカナ）での入力が必須"}
  validates :birth, presence: true
    
  has_many :items
  has_many :purchases
  
end