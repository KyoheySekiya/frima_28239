class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: /\A\S+@\S+\.\S+\z/}, 
                      uniqueness: true
    validates :password, confirmation: true, length: {minimum: 6}, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: "Password Include both letters and numbers"}
    validates :password_confirmation
    validates :familiy_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Familiy name Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "First name Full-width characters"}
    validates :familiy_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "Familiy name kana Full-width katakana characters"}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana Full-width katakana characters"}
    validates :birthday, numericality: { other_than: 0 }
  end
end
