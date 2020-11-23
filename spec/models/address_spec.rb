require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  describe '寄付情報の保存' do
    before do
      @user_donation = FactoryBot.build(:user_donation)
    end
    it 'postal_codeが空だと保存できないこと' do
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    end
    it 'prefectureを選択していないと保存できないこと' do
    end
    it 'cityは空でも保存できること' do
    end
    it 'house_numberは空でも保存できること' do
    end
    it 'building_nameは空でも保存できること' do
    end
    it 'priceが空だと保存できないこと' do
    end
    it 'priceが全角数字だと保存できないこと' do
    end
    it 'priceが1円未満では保存できないこと' do
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
    end
  end
end
