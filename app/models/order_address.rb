class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: 'を入力してください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'を数字のみで入力してください' }
  end  

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
