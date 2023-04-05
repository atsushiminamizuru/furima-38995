class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_prefecture

  validates :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
end
