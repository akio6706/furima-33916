FactoryBot.define do
  factory :order_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    area_id       { 2 }
    city          { '神戸市' }
    street        { '秋山1-1' }
    address       { '秋山ビル101' }
    phone_number  { '09012345678' }
  end
end
