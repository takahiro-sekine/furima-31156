FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '111-1111' }
    prefecture_id { 2 }
    municipalities { '東京都' }
    house_number { '渋谷区1−2−３' }
    building_name { '渋谷1−2−３' }
    phone_number { '08080341234' }
  end
end
