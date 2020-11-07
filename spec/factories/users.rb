FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '太郎' }
    kana_first_name { 'ヤマダ' }
    kana_last_name { 'タロウ' }
    birthday { '2010-12-03' }
  end
end
