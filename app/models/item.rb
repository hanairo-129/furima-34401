class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery
  belongs_to :area
  belongs_to :post_time

  with_options presence: true do
    validates :image
    validates :item_name
    validates :details
    validates :price
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
  validates :price, numericality: { only_integer: true, message: "Half-width number." }
  validates :category_id, numericality: { other_than: 1, message: "Select" }
  validates :status_id,   numericality: { other_than: 1, message: "Select" }
  validates :delivery_id, numericality: { other_than: 1, message: "Select" }
  validates :area_id,     numericality: { other_than: 1, message: "Select" }
  validates :post_time_id,     numericality: { other_than: 1, message: "Select" }

end

