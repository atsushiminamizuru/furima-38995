FactoryBot.define do
  factory :item_shipping_fee_status do
    id { Faker::Number.between(from: 1, to: 2) }
    name { '着払い（購入者負担）' }
  end
end
