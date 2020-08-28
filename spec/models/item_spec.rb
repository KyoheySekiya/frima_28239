require 'rails_helper'
include ActionDispatch::TestProcess

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.images.attach(fixture_file_upload('public/images/test_image.png'))
    end

    it '画像が空では登録できないこと' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Images can't be blank")
    end

    it '商品名が空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空では登録できないこと' do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it 'カテゴリーの情報が --- では登録できないこと' do
      @item.category_id = [1]
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態についての情報が --- では登録できないこと' do
      @item.condition_id = [1]
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担についての情報が --- では登録できないこと' do
      @item.delivery_fee_id = [1]
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域についての情報が --- では登録できないこと' do
      @item.ship_from_location_id = [1]
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship from location can't be blank")
    end

    it '発送までの日数についての情報が --- では登録できないこと' do
      @item.delivery_date_id = [1]
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end

    it '価格についての情報が空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が、¥300~¥9,999,999の間でないと登録できないこと' do
      @item.price = 99,999,999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price input value is outside the range of ¥300~9,999,999')
    end
  end
end
