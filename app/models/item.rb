class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_price
  belongs_to :shipping_area
  belongs_to :shipping_date
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :items_name, length: { maximum: 40 }
    validates :items_comments, length: { maximum: 1000 }
    validates :image
    validates :price, numericality: { only_integer: true }
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :shipping_price_id
    validates :shipping_area_id
    validates :shipping_date_id
  end
end
