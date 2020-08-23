require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'test.com'
      @user.valid?
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字未満では登録できないこと' do
      @user.password = '1'
      @user.password_confirmation = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でないと登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'familiy_nameが空だと登録できないこと' do
      @user.familiy_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familiy name can't be blank")
    end

    it 'familiy_nameが全角日本語でないと保存できないこと' do
      @user.familiy_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familiy name Full-width characters')
    end

    it 'first_nameが空だと登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name Full-width characters')
    end

    it 'familiy_name_readingが空だと登録できないこと' do
      @user.familiy_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Familiy name reading can't be blank")
    end

    it 'familiy_name_readingが全角カタカナでないと登録できないこと' do
      @user.familiy_name_reading = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Familiy name reading Full-width katakana characters')
    end

    it 'first_name_readingが空だと登録できないこと' do
      @user.first_name_reading = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading can't be blank")
    end

    it 'first_name_readingが全角カタカナでないと登録できないこと' do
      @user.first_name_reading = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name reading Full-width katakana characters')
    end

    it 'birthdayが空だと登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
