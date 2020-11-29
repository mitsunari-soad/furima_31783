class Donation
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postal,:prefecture_id,:city,:number,:phone,:build,:token
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal, format: {with: /\A\d{3}[-]\d{4}\z/, message: '数字及び-のみ'}
    validates :city
    validates :number
    validates :phone, length: {maximum: 11, message: '１１桁の数字のみ'}
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
   
  def save
    purchase = Purchase.create(user_id:user_id, item_id:item_id)
    Shipping.create(postal: postal, prefecture_id: prefecture_id, city: city, number: number, phone: phone, build: build, purchase_id: purchase.id)
  end
end