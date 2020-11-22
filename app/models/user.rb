class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）での入力が必須' }
    validates :first_yomigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'フリガナは、全角（カタカナ）での入力が必須' }
    validates :last_yomigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'フリガナは、全角（カタカナ）での入力が必須' }
    validates :birth
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '半角英数混合(半角英語のみ)'
  has_many :items
  has_many :purchases
end
