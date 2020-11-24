class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :municipalities
    validates :house_number
    validates :phone_number, format: { with: /\A\d{3}[-]\d{3,4}[-]\d{4}\z/ }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
