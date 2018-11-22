class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :categories_users, dependent: :destroy
  has_many :categories, through: :categories_users
  validates :birthday, :username, :email, :password, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
