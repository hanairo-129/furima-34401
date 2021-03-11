class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nick_name
    validates :birthday
    validates :password,  length: { minimum: 7 }, format: {with: /\A[a-zA-Z0-9]+\z/}
  end
  
  with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥々]/ } do
    validates :last_name
    validates :first_name
  end
      
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_reading
    validates :last_name_reading
  end

  has_many :items
  has_many :records

end
