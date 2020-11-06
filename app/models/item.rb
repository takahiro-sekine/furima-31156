class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belong_to :category
  belong_to :burden
  belong_to :shipping_day
  belong_to :source
  belong_to :status

  validates :product_name, :explanation, :price presence: true
  validates :category_id, :burden_id, :shipping_day_id, :source_id, :status_id, numericality: { other_than: 1 } 
end
