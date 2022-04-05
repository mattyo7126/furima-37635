class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_price, :shipping_area, :shipping_date
  belongs_to :user

  with_options presence: true do
    validates :items_name
    validates :items_comments
    validates :image
    validates :price, inclusion: { in: 300..9_999_999, allow_blank: true }, format: { with: /\A[0-9]+\z/, message: 'には半角数字を使用してください', allow_blank: true }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
  end
  
  # validates :price, numericality: true

  has_one_attached :image
  # has_one :order
end
