FactoryBot.define do
  factory :item do
    item_name      { 'test' }
    description    { 'test' }
    category_id       { 2 }
    state_id          { 2 }
    burden_id         { 2 }
    area_id           { 2 }
    day_id            { 2 }
    price { 1111 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test2_image.png'), filename: 'test2_image.png')
    end
  end
end
