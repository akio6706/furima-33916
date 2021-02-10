class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, { with: PASSWORD_REGEX, message: 'は半角英数字で入力して下さい。' }
  with_options presence: true do
    validates :nickname,   length: { maximum: 40 }
    validates :last_name,  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は苗字を入力して下さい。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は名前を入力して下さい。' }
    validates :last_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'はカタカナで入力して下さい。' }
    validates :birth_date
  end
end
