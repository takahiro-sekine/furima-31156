FactoryBot.define do
  factory :address do
    postal_code { 'MyString' }
    prefectures_id { 1 }
    municipalities { 'MyText' }
    address { 'MyText' }
    building_name { 'MyText' }
    phone_number { 'MyString' }
    purchase { '' }
  end
end
