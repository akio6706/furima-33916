require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品を購入できるとき' do
      it '入力するところが全てが適切に存在すれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'addressは空でも保存できる' do
        @order_address.address = ""
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁以内だと登録できる' do
        @order_address.phone_number = "09012345678"
        expect(@order_address).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'postal_codeが空では保存できない' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code をハイフンを入れて入力して下さい。")
      end
      it 'areaが「---」では保存できない' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 1')
      end
      it 'cityが空では保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では保存できない' do
        @order_address.street = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number は11ケタの数字(ハイフンなし)で入力して下さい。")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.postal_code = '1234567' 
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code をハイフンを入れて入力して下さい。")
      end
      it 'phone_numberが12桁以上では登録できない' do
        @order_address.phone_number = "123456789101"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は11ケタの数字(ハイフンなし)で入力して下さい。")
      end
      it 'phone_numberが英数字混合では存在できない' do
        @order_address.phone_number = "1234567test"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は11ケタの数字(ハイフンなし)で入力して下さい。")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
