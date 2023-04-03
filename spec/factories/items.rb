FactoryBot.define do
  factory :item do
    item_name { "MyString" }
    item_info { "MyText" }
    item_price { 1 }
    user { nil }
  end
end
