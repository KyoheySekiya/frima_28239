class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validate :images_presence

  def images_presence
    if images.attached?
    else
      errors.add(:images, "can't be blank")
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :ship_from_location
  belongs_to_active_hash :delivery_date

  with_options presence: true do
    validates :name
    validates :text
    validates :category_id, numericality: { other_than: 1, message: "Category can't be blank" }
    validates :condition_id, numericality: { other_than: 1, message: "Condition can't be blank" }
    validates :delivery_fee_id, numericality: { other_than: 1, message: "Delivery fee can't be blank" }
    validates :ship_from_location_id, numericality: { other_than: 1, message: "Ship from location can't be blank" }
    validates :delivery_date_id, numericality: { other_than: 1, message: "Delivery date can't be blank" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'input value is outside the range of ¥300~9,999,999' }
  end
end
