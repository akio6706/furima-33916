require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品の保存' do
      context '商品が出品できる' do
        it '入力するところが全て存在すれば登録できる' do
          expect(@item).to be_valid
        end
      end
      context '商品が出品できない' do
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'item_nameが空では登録できない' do
          @item.item_name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item name can't be blank")
        end
        it 'descriptionが空では登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'categoryが「---」では登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end
        it 'stateが「---」では登録できない' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('State must be other than 1')
        end
        it 'burdenが「---」では登録できない' do
          @item.burden_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Burden must be other than 1')
        end
        it 'areaが「---」では登録できない' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Area must be other than 1')
        end
        it 'dayが「---」では登録できない' do
          @item.day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Day must be other than 1')
        end
        it 'priceが空では登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが300~9,999,999以外では登録できない' do
          @item.price = 111
          @item.valid?
          expect(@item.errors.full_messages).to include('Price が範囲外です')
        end
        it 'priceが全角では登録できない' do
          @item.price = '１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は半角数字で入力して下さい。', 'Price が範囲外です')
        end
        it 'priceが半角英字では登録できない' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price は半角数字で入力して下さい。', 'Price が範囲外です')
        end
      end
    end
  end
end
