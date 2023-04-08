require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報登録' do
    before do
      order = FactoryBot.create(:order)
      @order_address = FactoryBot.build(:order_address, user_id: order.user_id, item_id: order.item_id)
    end
    context '購入できる場合' do
      it 'postal_code、city、addresses、phone_number、item_prefectureが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列であれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'phone_numberが10桁以上11桁以内の半角数値であれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'userが紐づいていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'itemが紐づいていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば購入ができる' do
        expect(@order_address).to be_valid
      end
    end
    context '購入できない場合' do
      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'cityが空では登録できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空では登録できない' do
        @order_address.addresses = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'item_prefectureが空では登録できない' do
        @order_address.item_prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'postal_codeが3桁ハイフン4桁ではない場合、登録できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeは全角英字が含まれている場合、登録できない' do
        @order_address.postal_code = '123-456Ａ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeは全角数字が含まれている場合、登録できない' do
        @order_address.postal_code = '123-456７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeは全角記号が含まれている場合、登録できない' do
        @order_address.postal_code = '123-456％'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'postal_codeは全角（漢字・ひらがな・カタカナ）が含まれている場合、登録できない' do
        @order_address.postal_code = '123-練しゅウ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it 'phone_numberは半角英字が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234a678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは半角記号が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234%678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは半角カタカナが含まれている場合、登録できない' do
        @order_address.phone_number = '0901234ｲ678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは全角英字が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234567A'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは全角数字が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234567８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは全角記号が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234567％'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numberは全角（漢字・ひらがな・カタカナ）が含まれている場合、登録できない' do
        @order_address.phone_number = '0901234練しゅウ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'phone_numbereが9桁以下の半角数値では登録できない' do
        @order_address.phone_number = Faker::Number.leading_zero_number(digits: 9)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'phone_numbereが12桁以上の半角数値では登録できない' do
        @order_address.phone_number = Faker::Number.leading_zero_number(digits: 12)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short')
      end
      it 'userが紐づいていなければ登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
