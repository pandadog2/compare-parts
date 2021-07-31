require 'rails_helper'

RSpec.describe CarModel, type: :model do
  before do
    @car_model = FactoryBot.build(:car_model)
  end

  describe 'car_modelの保存' do
    context 'car_modelが登録できる場合' do
      it 'car_model_codeが存在すれば登録できる' do
        expect(@car_model).to be_valid
      end
    end
    context 'car_modelが登録できない場合' do
      it 'car_model_codeが空ではできない' do
        @car_model.car_model_code = ''
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code can't be blank")
      end
      it 'car_model_codeが小文字では登録できない' do
        @car_model.car_model_code = '100a'
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code is 3 half-width numbers + 1 half-width alphabet (uppercase)")
      end
      it 'car_model_codeが英字のみでは登録できない' do
        @car_model.car_model_code = 'ABCD'
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code is 3 half-width numbers + 1 half-width alphabet (uppercase)")
      end
      it 'car_model_codeが数字のみでは登録できない' do
        @car_model.car_model_code = '1234'
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code is 3 half-width numbers + 1 half-width alphabet (uppercase)")
      end
      it 'car_model_codeが3桁以下では登録できない' do
        @car_model.car_model_code = '12A'
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code is 3 half-width numbers + 1 half-width alphabet (uppercase)")
      end
      it 'car_model_codeが5桁以上では登録できない' do
        @car_model.car_model_code = '1234A'
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("Car model code is 3 half-width numbers + 1 half-width alphabet (uppercase)")
      end
      it 'userが紐付いていなければ登録できない' do
        @car_model.user = nil
        @car_model.valid?
        expect(@car_model.errors.full_messages).to include("User must exist")
      end
    end
  end
end
