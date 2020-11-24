FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '漢字' }
    last_name { '漢字' }
    first_yomigana { 'アアア' }
    last_yomigana { 'アアア' }
    birth { 20_101_111 }
  end
end
