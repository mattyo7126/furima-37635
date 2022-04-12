FactoryBot.define do
  factory :order_address do
    post_code { '123-4567'}
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '柳ビル103' }
    phone_number { 1234567890 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
