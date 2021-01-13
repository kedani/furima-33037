class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :email, presence: true, uniqueness: true
         validates :encryted_password, presence: true
                                       length: {minimum: 6 }
         validates :nickname, presence: true
         validates :surname, presence: true
         validates :first_name, presence: true
         validates :birthday, presence: true
         validates :surname_kana, presence: true
         validates :first_name_kana, presence: true
       
         has_many :items
         has_many :orders
end
