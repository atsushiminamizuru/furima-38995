FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    city { '横浜市緑区' }
    addresses { '青山1-1-1' }
    building { '柳ビル103' }
    phone_number { '09012345678' }
    item_prefecture_id { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
