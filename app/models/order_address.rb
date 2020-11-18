class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipalities, :address, :building_name, :phone, :order
  with_options presence: true do
    validates :postal_code, format:{/\A\d{7}\z/}
    validates :municipalities
    validates :address
    validates :building_name
    validates :phone_number, format:{/\A\d{10,11}\z/}
    validates :order
  end
  validates :prefectures_id, numericality: { other_than: 1 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefectures

  def save
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name,order_id: order.id)
    Order.create(item_id: item.id, user_id: user.id)
end