require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'items#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    cotext '商品が出品できない時' do
        it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end

    cotext '商品が出品できない時' do
      it ' 商品名が必須であること' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    end

    cotext '商品が出品できない時' do
      it '商品の説明が必須であること' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
    end

    cotext '商品が出品できない時' do
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
    end

    cotext '商品が出品できない時' do
      it '商品の状態についての情報が必須であること' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Status is not a number')
      end
    end

    cotext '商品が出品できない時' do
      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden is not a number')
      end
    end

    cotext '商品が出品できない時' do
      it '発送元の地域についての情報が必須であること' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
    end

    cotext '商品が出品できない時' do
      it '発送までの日数についての情報が必須であること' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a number')
      end
    end

    cotext '商品が出品できない時' do
      it '価格についての情報が必須であること' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end

    cotext '商品が出品できない時' do
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
    end

    cotext '商品が出品できない時' do
      it '価格の範囲が、¥300~¥9,999,999の間であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
    end

    cotext '商品が出品できない時' do
      it '販売価格は半角数字のみ保存可能であること' do
        @item.price = /\A[０-９]+\z/
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字のみ')
      end
    end

    cotext '商品が出品できない時' do
      it '商品状態のidが１（--）の場合は保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
    end

    cotext '商品が出品できない時' do
      it '送料のidが１（--）の場合は保存できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Burden must be other than 1')
      end
    end

    cotext '商品が出品できない時' do
      it '配送日数のidが１（--）の場合は保存できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
    end

    cotext '商品が出品できない時' do
      it 'カテゴリーのidが１（--）の場合は保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
    end

    cotext '商品が出品できない時' do
      it '発送元のidが１（--）の場合は保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
    end
  end
end
