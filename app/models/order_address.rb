class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :addresses
    validates :phone_number,
              length: {
                minimum: 10,
                maximum: 11,
                message: 'is too short'
              },
              numericality: {
                only_integer: true,
                message: 'is invalid. Input only number'
              }
  end
  validates :item_prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.new(item_id: item_id, user_id: user_id)
    order.save

    address = Address.new(
      postal_code: postal_code,
      item_prefecture_id: item_prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number,
      order_id: order.id
    )
    address.save
  end
end
