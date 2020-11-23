FactoryBot.define do
  factory :address do
    postal_code { '321-2123' }
    prefectures_id { 2 }
    municipalities { '東京都' }
    address { '渋谷区' }
    building_name { '渋谷1−2−３' }
    phone_number { '08080341234' }
  end
end
