class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_price, :shipping_area, :shipping_date

  validates :items_name, :items_comments, presence: true
  validates :price, numericality: { in: 300..9999999 }, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_price_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank" }


  belongs_to :user
  has_one_attached :image
  # has_one :order
end
