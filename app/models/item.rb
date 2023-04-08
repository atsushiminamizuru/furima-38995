class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price,
            presence: true,
            numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
            inclusion: { in: 300..9_999_999, message: 'is out of setting range' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_sales_status
  belongs_to :item_shipping_fee_status
  belongs_to :item_prefecture
  belongs_to :item_scheduled_delivery

  validates :item_category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_sales_status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_shipping_fee_status_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_scheduled_delivery_id, numericality: { other_than: 0, message: "can't be blank" }
end
