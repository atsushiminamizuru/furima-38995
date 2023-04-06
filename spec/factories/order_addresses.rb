FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567'}
    city { '横浜市緑区' }
    addresses { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { Faker::Number.number(digits: rand(10..11)).to_s }
    item_prefecture_id { 1 }
  end
end
