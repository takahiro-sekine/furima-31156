require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '全てが適切に入力されると登録できる' do
      expect(@item).to be_valid
    end

    it '商品画像がないと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと保存できない' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it '商品の説明がないと保存できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報がないと保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態についての情報がないと保存できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end

    it '配送料の負担についての情報がないと保存できない' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden is not a number')
    end

    it '発送元の地域についての情報がないと保存できない' do
      @item.source_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Source is not a number')
    end

    it '発送までの日数についての情報がないと保存できない' do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping days is not a number')
    end

    it '価格についての情報がないと保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間でないと保存できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '販売価格は半角数字でないと保存できない' do
      @item.price = '１２３４'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'userが紐付いていないと保存できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
