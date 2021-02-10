FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_kana             { 'ヤマダ' }
    first_kana            { 'タロウ' }
    birth_date            { Faker::Date.backward }
  end
end
