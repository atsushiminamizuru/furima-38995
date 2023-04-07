FactoryBot.define do
  factory :item_category do
    id { Faker::Number.between(from: 1, to: 10) }
    name { '本・音楽・ゲーム' }
  end
end
