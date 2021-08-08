require 'rails_helper'

RSpec.describe Part, type: :model do
  before do
    @part = FactoryBot.build(:part)
  end

  describe 'partの保存' do
    context 'partが登録できる場合' do
      it 'images、part_name_id、product_number、material_id、thickness、weight、supplier_idがあれば登録できる' do
        expect(@part).to be_valid
      end
    end
    context 'partが登録できない場合' do
      it 'imagesが空では登録できない' do
        @part.images = nil
        @part.valid?
        expect(@part.errors.full_messages).to include("Images can't be blank")
      end
      it 'part_name_idが空では登録できない' do
        @part.part_name_id = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Part name can't be blank")
      end
      it 'part_name_idが1では登録できない' do
        @part.part_name_id = '1'
        @part.valid?
        expect(@part.errors.full_messages).to include("Part name must be other than 1")
      end
      it 'product_numberが空では登録できない' do
        @part.product_number = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Product number can't be blank")
      end
      it 'product_numberに-(ハイフン)がないと登録できない' do
        @part.product_number = '1111111111'
        @part.valid?
        expect(@part.errors.full_messages).to include("Product number is 5 digits-5 digits (half-width number)")
      end
      it 'product_numberは半角数字5桁-5桁でないと登録できない' do
        @part.product_number = '1111-1111'
        @part.valid?
        expect(@part.errors.full_messages).to include("Product number is 5 digits-5 digits (half-width number)")
      end
      it '重複したproduct_numberが存在する場合登録できない' do
        @part.save
        another_part = FactoryBot.build(:part)
        another_part.product_number = @part.product_number
        another_part.valid?
        expect(another_part.errors.full_messages).to include("Product number has already been taken")
      end
      it 'material_idが空では登録できない' do
        @part.material_id = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Material can't be blank")
      end
      it 'material_idが1では登録できない' do
        @part.material_id = '1'
        @part.valid?
        expect(@part.errors.full_messages).to include("Material must be other than 1")
      end
      it 'thicknessが空では登録できない' do
        @part.thickness = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Thickness can't be blank")
      end
      it 'thicknessは自然数のみでは登録できない' do
        @part.thickness = '99'
        @part.valid?
        expect(@part.errors.full_messages).to include("Thickness is 2 digits for the decimal part and 2 digits or less for the natural number part")
      end
      it 'thicknessは自然数部分が3桁以上では登録できない' do
        @part.thickness = '100.00'
        @part.valid?
        expect(@part.errors.full_messages).to include("Thickness is 2 digits for the decimal part and 2 digits or less for the natural number part")
      end
      it 'thicknessは小数部分が3桁以上では登録できない' do
        @part.thickness = '0.001'
        @part.valid?
        expect(@part.errors.full_messages).to include("Thickness is 2 digits for the decimal part and 2 digits or less for the natural number part")
      end
      it 'weightが空では登録できない' do
        @part.weight = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Weight can't be blank")
      end
      it 'weightは自然数のみでは登録できない' do
        @part.weight = '99999'
        @part.valid?
        expect(@part.errors.full_messages).to include("Weight is 2 digits for the decimal part and 5 digits or less for the natural number part")
      end
      it 'weightは自然数部分が6桁以上では登録できない' do
        @part.weight = '100000.00'
        @part.valid?
        expect(@part.errors.full_messages).to include("Weight is 2 digits for the decimal part and 5 digits or less for the natural number part")
      end
      it 'weightは小数部分が3桁以上では登録できない' do
        @part.weight = '0.001'
        @part.valid?
        expect(@part.errors.full_messages).to include("Weight is 2 digits for the decimal part and 5 digits or less for the natural number part")
      end
      it 'supplier_idが空では登録できない' do
        @part.supplier_id = ''
        @part.valid?
        expect(@part.errors.full_messages).to include("Supplier can't be blank")
      end
      it 'supplier_idが1では登録できない' do
        @part.supplier_id = '1'
        @part.valid?
        expect(@part.errors.full_messages).to include("Supplier must be other than 1")
      end
      it 'userが紐付いていなければ登録できない' do
        @part.user = nil
        @part.valid?
        expect(@part.errors.full_messages).to include("User must exist")
      end
      it 'car_modelが紐付いていなければ登録できない' do
        @part.car_model = nil
        @part.valid?
        expect(@part.errors.full_messages).to include("Car model must exist")
      end
    end
  end
end
