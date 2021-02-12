class Item < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :item_name
    validates :description
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。' }
  end
  validates :price, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 299,
                                    less_than_or_equal_to: 10_000_000,
                                    message: 'が範囲外です' }
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  belongs_to :user
  has_one_attached :image
end
