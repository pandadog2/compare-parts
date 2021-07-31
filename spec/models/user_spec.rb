require 'rails_helper'

RSpec.describe @user, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'user新規登録' do
    context '新規登録できるとき' do
      it 'name、email、password、password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nameが全角漢字・かな・カナ・半角英字であれば登録できる' do
        @user.name = '名前'
        expect(@user).to be_valid
      end
      it 'nameが10文字以下であれば登録できる' do
        @user.name = 'aaaaaaaaaa'
        expect(@user).to be_valid 
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'pass12'
        @user.password_confirmation = 'pass12'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameに全角英字は使用できない' do
        @user.name = 'ＮＡＭＥ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is other than numbers and double-byte alphabets")
      end
      it 'nameに数字は使用できない' do
        @user.name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is other than numbers and double-byte alphabets")
      end
      it 'nameが11文字以上では登録できない' do
        @user.name = 'a' * 11
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is too long (maximum is 10 characters)")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'pass1'
        @user.password_confirmation = 'pass1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
