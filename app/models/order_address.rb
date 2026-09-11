class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :token, presence: true
  end

  validates :postal_code,
            presence: true,
            format: {
              with: /\A\d{3}-\d{4}\z/,
              message: 'is invalid. Include hyphen(-)',
              allow_blank: true
            }

  validates :prefecture_id,
            numericality: {
              other_than: 1,
              message: "can't be blank"
            }

  validates :phone_number,
            presence: true,
            format: {
              with: /\A\d{10,11}\z/,
              message: 'is invalid',
              allow_blank: true
            }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      house_number: house_number,
      building_name: building_name,
      phone_number: phone_number,
      order_id: order.id
    )
  end
end
