require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入登録' do
    before do
      @purchaseadd = FactoryBot.build(:purchase_address)
    end

    it 'tokenが空では登録できないこと' do
      @purchaseadd.token = ''
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では登録できないこと' do
      @purchaseadd.postal_code = nil
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンが含まれていなければ登録できないこと' do
      @purchaseadd.postal_code = '1231234'
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefectureが --- では登録できないこと' do
      @purchaseadd.prefecture = 1
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空では登録できないこと' do
      @purchaseadd.city = nil
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では登録できないこと' do
      @purchaseadd.address = nil
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では登録できないこと' do
      @purchaseadd.phone_number = nil
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンが含まれていると登録できないこと' do
      @purchaseadd.phone_number = '123-1234-1234'
      @purchaseadd.valid?
      expect(@purchaseadd.errors.full_messages).to include('Phone number is invalid. Half-width number')
    end

    it 'tokenが存在すれば登録できること' do
      @purchaseadd.token = 'hoge'
      expect(@purchaseadd).to be_valid
    end

    it 'postal_codeにハイフンが含まれていれば登録できること' do
      @purchaseadd.postal_code = '123-1234'
      expect(@purchaseadd).to be_valid
    end

    it 'prefectureの情報が --- 以外であれば登録できること' do
      @purchaseadd.prefecture = 2
      expect(@purchaseadd).to be_valid
    end

    it 'cityが存在すれば登録できること' do
      @purchaseadd.city = '渋谷区'
      expect(@purchaseadd).to be_valid
    end

    it 'addressが存在すれば登録できること' do
      @purchaseadd.address = '渋谷1-1'
      expect(@purchaseadd).to be_valid
    end

    it 'phone_numberが半角数字のみであれば登録できること' do
      @purchaseadd.phone_number = '12312341234'
      expect(@purchaseadd).to be_valid
    end

    it 'phone_numberがハイフンは不要で、11桁以内であれば登録できること' do
      @purchaseadd.phone_number = '1212341234'
      expect(@purchaseadd).to be_valid
    end
  end
end
