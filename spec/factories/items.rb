FactoryBot.define do
  factory :item do
    product_name { 'MyString' }
    explanation { 'MyText' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    price { 350 }
    source_id { 2 }
    shipping_days_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.image.png'), filename: 'test.image.png')
    end
  end
end
