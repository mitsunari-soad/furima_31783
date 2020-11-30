require 'rails_helper'

RSpec.describe PurchaseShippingForm, type: :model do
  describe  'purchase#create' do
    before do
      @purchase = FactoryBot.build(:PurchaseShippingForm)
    end
  
    it '郵便番号には-が必須であること' do
      @purchase.postal = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal 数字及び-のみ")
    end

    it '郵便番号が必須であること' do
      @purchase.postal = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Postal can't be blank")
    end

    it '市区町村名が必須であること' do
      @purchase.city = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @purchase.number = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Number can't be blank")
    end

    it '電話番号が必須であること' do
      @purchase.phone = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号が１１桁であること' do
      @purchase.phone = '123456789123'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone １１桁の数字のみ")
    end

    it 'クレジットカード情報が必須であること' do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Token can't be blank")
    end

    it '都道府県が必須であること' do
      @purchase.prefecture_id = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end   
    
    it '都道府県が1の場合は購入できない' do
      @purchase.prefecture_id = 1
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it '電話番号はーがあると登録できない' do
      @purchase.phone = '111-1111-1111'
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Phone １１桁の数字のみ")
    end
  
    it 'すべての情報が正しいフォーマットで入力されていれば購入できる' do
      expect(@purchase).to be_valid
    end

    it '建物名が空でも購入できる' do
      @purchase.build = nil
      expect(@purchase).to be_valid
    end
  end
end  