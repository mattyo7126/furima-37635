require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての情報が正しく入力されていて、tokenがあれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号を入力してください"
      end
      it 'prerfectureを選択しないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "都道府県は1以外の値にしてください"
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "市区町村を入力してください"
      end
      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "番地を入力してください"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'userが紐づいていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "ユーザーを入力してください"
      end
      it 'itemが紐づいていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "商品を入力してください"
      end
      it 'post_codeにはハイフンがないと保存できないこと' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'post_codeは半角数字でないと保存できないこと' do
        @order_address.post_code = '１２３-aあｱ亜'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'post_codeは6桁以下では保存できないこと' do
        @order_address.post_code = '123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'post_codeは8桁以上では保存できないこと' do
        @order_address.post_code = '123-45678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "郵便番号は不正な値です"
      end
      it 'phone_numberにはハイフンがあると保存できないこと' do
        @order_address.phone_number = '123-456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'phone_numberは半角数字でないと保存できないこと' do
        @order_address.phone_number = '１２３aあｱ亜'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'phone_numberは9桁以下では保存できないこと' do
        @order_address.phone_number = '090111222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end
      it 'phone_numberは12桁以上では保存できないこと' do
        @order_address.phone_number = '090111122223'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "電話番号は不正な値です"
      end

      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "カード情報を入力してください"
      end
    end
  end
end
