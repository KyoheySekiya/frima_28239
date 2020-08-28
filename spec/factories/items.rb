FactoryBot.define do
  factory :item do
    name { 'test' }
    text { 'texttext' }
    category_id { 2 }
    condition_id { 2 }
    delivery_fee_id { 2 }
    ship_from_location_id { 2 }
    delivery_date_id { 2 }
    price { 1000 }
    association :user
  end
end
