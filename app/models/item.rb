class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :description
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :user
  end

  belongs_to :user
  has_one_attached :image
end
