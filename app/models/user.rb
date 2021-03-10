class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name,              presence: true
  validates :encrypted_password,     presence: true, length: { minimum: 7 }
  validates :last_name,              presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_reading,      presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name,             presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_reading,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday,               presence: true

  has_many :items
  has_many :records

end
