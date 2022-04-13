require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '商品情報が保存できる場合' do
      it 'image、items_name、items_comments、priceがあり、プルダウンが全て選択済みであれば保存される' do
        expect(@item).to be_valid
      end
    end

    context '商品情報が保存できない場合' do
      it 'imageがないと商品情報は保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を入力してください"
      end
      it 'items_nameがないと保存できない' do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名を入力してください"
      end
      it 'items_commentsがないと保存できない' do
        @item.items_comments = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      end
      it 'priceがないと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください", "価格は数値で入力してください"
      end
      it 'category_idがないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "カテゴリーは1以外の値にしてください"
      end
      it 'condition_idがないと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の状態は1以外の値にしてください"
      end
      it 'shipping_priceがないと保存できない' do
        @item.shipping_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
      end
      it 'shipping_area_idがないと保存できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送元の地域は1以外の値にしてください"
      end
      it 'shipping_date_idがないと保存できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "ユーザーを入力してください"
      end
      it 'items_nameが41文字以上だと保存できない' do
        @item.items_name = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include "商品名は40文字以内で入力してください"
      end
      it 'items_commentsが1001文字以上だと保存できない' do
        @item.items_comments = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include "商品の説明は1000文字以内で入力してください"
      end
      it 'priceが299円以下だと保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は300以上の値にしてください"
      end
      it 'priceが10000000円以上だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は9999999以下の値にしてください"
      end
      it 'priceに半角数字以外を含むと保存できない' do
        @item.price = 'aあｱ亜1'
        @item.valid?
        expect(@item.errors.full_messages).to include "価格は数値で入力してください"
      end
    end
  end
end
