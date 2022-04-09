class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ , message: 'を入力してください' }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'を数字のみで入力してください' }
  end  
end
