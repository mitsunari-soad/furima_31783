FactoryBot.define do
  factory :PurchaseShippingForm do
    user_id { 1 }
    item_id { 1 }
    postal {'111-1111'}
    city { '松前町' }
    number { '10-10' }
    phone { '12345678912' }
    token { 'sample' }
    prefecture_id { 3 }
  end
end
