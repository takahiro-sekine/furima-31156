require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid')
    end
    it 'prefectureを選択していないと保存できないこと' do
      @order_address.prefecture_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'municipalitiesは空だと保存できないこと' do
      @order_address.municipalities = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = nil
      expect(@order_address).to be_valid
    end
    it 'phone_numberは空だと保存できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10文字以下だと保存できないこと' do
      @order_address.phone_number = '090234234'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    it 'phone_numberが11文字以上だと保存できないこと' do
      @order_address.phone_number = '0902342343434'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では登録できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
