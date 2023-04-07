FactoryBot.define do
  factory :item_prefecture do
    id { Faker::Number.between(from: 1, to: 47) }
    name { '大阪府' }
  end
end
