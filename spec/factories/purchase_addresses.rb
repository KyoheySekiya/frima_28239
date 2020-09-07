FactoryBot.define do
  factory :purchase_address do
    token { 'hoge' }
    postal_code { '123-4567' }
    prefecture { 2 }
    city { '渋谷区' }
    address { '渋谷1-1' }
    phone_number { '12312341234' }
  end
end
