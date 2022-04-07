class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_code
    validates :prefecture_id
    validates :city
    validates :phone_number
  end  
end
