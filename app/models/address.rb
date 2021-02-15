class Address < ApplicationRecord
  with_options presence: true do
    validates :postal_code, numericality: { with: /^\d{3}[-]\d{4}$|^\d{3}[-]\d{2}$|^\d{3}$/, message: 'をハイフンを入れて入力して下さい。' }
    validates :city
    validates :street
    validates :phone_number, numericality: { with: /^\d{10}$|^\d{11}$/, message: 'は10or11ケタの数字で入力して下さい。' }
  end
  validates :phone_number, length: { maximum: 11 }
  validates :area_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :order
end