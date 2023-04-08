FactoryBot.define do
  factory :order do
    association :user, factory: :user
    association :item, factory: :item
  end
end
