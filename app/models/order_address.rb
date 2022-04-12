class OrderAddress 
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token, :item_price

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, allow_blank: true }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, allow_blank: true }
    validates :user_id
    validates :item_id
    validates :token
  end  

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :prefecture_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
