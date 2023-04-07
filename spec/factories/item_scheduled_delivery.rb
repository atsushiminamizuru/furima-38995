FactoryBot.define do
  factory :item_scheduled_delivery do
    id { Faker::Number.between(from: 1, to: 3) }
    name { '2~3日で発送' }
  end
end
