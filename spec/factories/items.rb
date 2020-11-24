FactoryBot.define do
  factory :item do
    name { Faker::Name.last_name }
    introduction { Faker::Science.scientist }
    price { 400 }
    status_id { 3 }
    category_id { 3 }
    burden_id { 3 }
    prefecture_id { 3 }
    shipping_day_id { 2 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/test_image/test1.jpg'), filename: 'test1.jpg', content_type: 'image/jpg')
    end
  end
end
