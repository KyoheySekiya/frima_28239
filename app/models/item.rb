class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_from_location
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :images
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :ship_from_location_id, numericality: { other_than: 1 }
    validates :delivery_date_id, numericality: { other_than: 1 }
    validates :price
  end
end
