class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :city, :street, :address, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}\z/, message: 'をハイフンを入れて入力して下さい。' }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は11ケタの数字(ハイフンなし)で入力して下さい。' }
  end
  validates :area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, city: city, street: street, address: address, phone_number: phone_number, order_id: order.id)
  end
end
