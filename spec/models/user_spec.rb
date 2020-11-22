require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?

      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      user = User.new(email: 'aaa.com')
      user.valid?
      expect(user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数混合(半角英語のみ)')
    end

    it '数字のみでは登録できないこと' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数混合(半角英語のみ)')
    end
    
    it '全角では登録できないこと' do
      @user.password = '１１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password 半角英数混合(半角英語のみ)')
    end
    
    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = 'aaa111'
      @user.password_confirmation = 'aaa112'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'ユーザー本名は、名字と名前がそれぞれ必須であること' do
      @user.first_name = '漢字'
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 全角（漢字・ひらがな・カタカナ）での入力が必須')
    end

    it 'ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること' do
      @user.first_yomigana = 'アアア'
      @user.last_yomigana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last yomigana can't be blank")
    end

    it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_yomigana = 'あ'
      @user.last_yomigana = 'あ'
      @user.valid?

      expect(@user.errors.full_messages).to include('First yomigana フリガナは、全角（カタカナ）での入力が必須')
    end

    it '生年月日が必須であること' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
