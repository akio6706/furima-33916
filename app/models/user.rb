class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, { with: PASSWORD_REGEX, message: 'は半角英数字で入力して下さい。' }
  with_options presence: true do
    validates :nickname,   length: { maximum: 40 }
    validates :birth_date
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は名前を入力して下さい。' } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' } do
      validates :last_kana
      validates :first_kana
    end
  end
end
