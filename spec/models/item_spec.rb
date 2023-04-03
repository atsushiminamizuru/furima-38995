require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '新規登録できる場合' do
      it 'imageとitem_nameとitem_infoとitem_price、item_categoryとitem_sales_status、
      item_shipping_fee_statusとitem_prefectureとitem_scheduled_deliveryが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'item_priceが半角数値かつ300以上9,999,999以下であれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空では登録できない' do
        @item.item_info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it 'item_categoryが空では登録できない' do
        @item.item_category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_sales_statusが空では登録できない' do
        @item.item_sales_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item sales status can't be blank")
      end
      it 'item_shipping_fee_statusが空では登録できない' do
        @item.item_shipping_fee_status_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee status can't be blank")
      end
      it 'item_prefectureが空では登録できない' do
        @item.item_prefecture_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item prefecture can't be blank")
      end
      it 'item_scheduled_deliveryが空では登録できない' do
        @item.item_scheduled_delivery_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item scheduled delivery can't be blank")
      end
      it 'item_priceは半角英字が含まれている場合、登録できない' do
        @item.item_price = '123a56'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'item_priceは全角数字を含むと登録できない' do
        @item.item_price = '123４56'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'item_priceは全角（漢字・ひらがな・カタカナ）が含まれている場合、登録できない' do
        @item.item_price = '練しゅウ123'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is invalid. Input half-width characters')
      end
      it 'item_priceが299以下では登録できない' do
        @item.item_price = Faker::Number.between(from: -99_999_999, to: 299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
      it 'item_priceが10,000,000以上では登録できない' do
        @item.item_price = Faker::Number.between(from: 10_000_000, to: 99_999_999)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is out of setting range')
      end
    end
  end
end
