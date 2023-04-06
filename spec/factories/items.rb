FactoryBot.define do
  factory :item_category do
    id { Faker::Number.between(from: 1, to: 10) }
  end
  factory :item_sales_status do
    id { Faker::Number.between(from: 1, to: 6) }
  end
  factory :item_shipping_fee_status do
    id { Faker::Number.between(from: 1, to: 2) }
  end
  factory :item_prefecture do
    id { Faker::Number.between(from: 1, to: 47) }
  end
  factory :item_scheduled_delivery do
    id { Faker::Number.between(from: 1, to: 3) }
  end
  factory :item do
    # item_name { Faker::String.random(length: 1..40) }
    item_name { '練習' }
    item_info { Faker::Lorem.paragraph_by_chars(number: 1000) }
    item_price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user, factory: :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :item_category, factory: :item_category
    association :item_sales_status, factory: :item_sales_status
    association :item_shipping_fee_status, factory: :item_shipping_fee_status
    association :item_prefecture, factory: :item_prefecture
    association :item_scheduled_delivery, factory: :item_scheduled_delivery
  end
end
