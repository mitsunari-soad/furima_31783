class Item < ApplicationRecord
  
  has_one_attached :image
  has_one :purchase
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    validates :price,format: { with: /\A[0-9]+\z/, message: '半角数字のみ' },numericality: {greater_than_or_equal_to: 300,less_than:9999999}
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status,:category,:burden,:prefecture,:shipping_day
  
  validates :prefecture_id, numericality: { other_than: 48 }
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :burden_id
    validates :shipping_day_id
    validates :category_id
  end
end
