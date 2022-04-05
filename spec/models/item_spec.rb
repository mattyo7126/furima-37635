require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe '商品情報の保存' do
  context "商品情報が保存できる場合" do
    it "image、items_name、items_comments、priceがあり、プルダウンが全て選択済みであれば保存される" do
      expect(@item).to be_valid
    end
  end
  
  context "商品情報が保存できない場合" do
    it "imageがないと商品情報は保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it "items_nameがないと保存できない" do
      @item.items_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Items name can't be blank"
    end
    it "items_commentsがないと保存できない" do
      @item.items_comments = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Items comments can't be blank"
    end
    it "priceがないと保存できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank" 
    end
    it "category_idがないと保存できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "condition_idがないと保存できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it "shipping_priceがないと保存できない" do
      @item.shipping_price_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping price can't be blank"
    end
    it "shipping_area_idがないと保存できない" do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping area can't be blank"
    end
    it "shipping_date_idがないと保存できない" do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end
    it "ユーザーが紐付いていないと保存できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include  "User must exist"
    end
    it "items_nameが41文字以上だと保存できない" do
      @item.items_name = Faker::Lorem.characters(number: 41)
      @item.valid?
      expect(@item.errors.full_messages).to include "Items name is too long (maximum is 40 characters)"
    end
    it "items_commentsが1001文字以上だと保存できない" do
      @item.items_comments = Faker::Lorem.characters(number: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include "Items comments is too long (maximum is 1000 characters)"
    end
    it "priceが299円以下だと保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it "priceが10000000円以上だと保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not included in the list"
    end        
  end
 end  
end                       