class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :birthday, :username, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
