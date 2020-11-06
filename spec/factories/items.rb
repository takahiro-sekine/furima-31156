FactoryBot.define do
  factory :item do
    product_name { "MyString" }
    explanation { "MyText" }
    category_id { 1 }
    status_id { 1 }
    burden_id { 1 }
    price { 1 }
    source_id { 1 }
    shipping_days_id { 1 }
  end
end
