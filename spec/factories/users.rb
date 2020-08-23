FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'pass1111' }
    password_confirmation { 'pass1111' }
    familiy_name { Gimei.name.last.kanji }
    first_name { Gimei.name.first.kanji }
    familiy_name_reading { Gimei.name.last.katakana }
    first_name_reading { Gimei.name.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
