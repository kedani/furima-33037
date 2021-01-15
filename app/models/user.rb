class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          #validates :email, presence: true
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: 'should contain both letters and numbers' 
            #validates :encryted_password, presence: true
  
          validates :nickname, presence: true
          with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
            validates :surname, presence: true
            validates :first_name, presence: true
          end
          validates :birthday, presence: true
          with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } do
            validates :surname_kana, presence: true
            validates :first_name_kana, presence: true
          end
       
         has_many :items
         has_many :orders
end
