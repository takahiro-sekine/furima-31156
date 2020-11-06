require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全てが適切に入力されると登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'kana_first_nameを入力しないと登録できない' do
      @user.kana_first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    it 'kana_last_nameを入力しないと登録できない' do
      @user.kana_last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last name can't be blank")
    end

    it 'first_nameを入力しないと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameを入力しないと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameは半角文字では登録できない' do
      @user.first_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'last_nameは半角文字では登録できない' do
      @user.last_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'kana_first_nameはカタカナで入力しないと登録できない' do
      @user.kana_first_name = 'たなか'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid')
    end

    it 'kana_last_nameはカタカナで入力しないと登録できない' do
      @user.kana_last_name = 'じろう'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name is invalid')
    end

    it 'kana_first_nameは半角文字では登録できない' do
      @user.kana_first_name = 'ﾀﾅｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana first name is invalid')
    end

    it 'kana_last_nameは半角文字では登録できない' do
      @user.kana_last_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Kana last name is invalid')
    end

    it 'パスワードが５文字以下だと登録できない' do
      @user.password = '1hoge'
      @user.password_confirmation = '1hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '12hoge'
      @user.password_confirmation = '23hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'メールアドレスには＠が入っていないと登録できない' do
      @user.email = 'testtesttest'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'birthdayは空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '重複したメールアドレスは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが半角数字のみだと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英字のみだと登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation= 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  end
end
