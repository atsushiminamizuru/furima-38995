FactoryBot.define do
  factory :item_sales_status do
    id { Faker::Number.between(from: 1, to: 6) }
    name { '新品・未使用' }
  end
end
