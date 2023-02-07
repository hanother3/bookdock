class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :area_id, :city, :house_number, :building_name, :phone_number, :user_id, :old_book_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city, :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id, :old_book_id, :token
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, old_book_id: old_book_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, house_number: house_number,
                           building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
