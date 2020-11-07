class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :source
  belongs_to_active_hash :status

  validates :product_name, :explanation, :price, :image, presence: true
  validates :category_id, :burden_id, :shipping_days_id, :source_id, :status_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true }
  belongs_to :user
end
