require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe  'purchase#create' do
    before do
      @donation = FactoryBot.build(:donation)
    end
  
    it '郵便番号には-が必須であること' do
      @donation.postal = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Postal 数字及び-のみ")
    end

    it '郵便番号が必須であること' do
      @donation.postal = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Postal can't be blank")
    end

    it '市区町村名が必須であること' do
      @donation.city = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @donation.number = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Number can't be blank")
    end

    it '電話番号が必須であること' do
      @donation.phone = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号が１１桁であること' do
      @donation.phone = '123456789123'
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Phone １１桁の数字のみ")
    end

    it 'クレジットカード情報が必須であること' do
      @donation.token = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Token can't be blank")
    end

    it '都道府県が必須であること' do
      @donation.prefecture_id = nil
      @donation.valid?
      expect(@donation.errors.full_messages).to include("Prefecture can't be blank")
    end   
  end
end  