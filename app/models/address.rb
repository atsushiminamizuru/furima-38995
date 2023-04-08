class Address < ApplicationRecord
  belongs_to :order

  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to :item_prefecture #=>addressは登録したprefectureを表示しない為、アソシエーション不要
end
