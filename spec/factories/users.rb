FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { "#{Faker::Alphanumeric.alpha(number: 6)}1a" }
    first_name            { '安倍' }
    last_name             { '太郎' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'タロウ' }
    birth_date            { '1933/11/12' }
  end
end
