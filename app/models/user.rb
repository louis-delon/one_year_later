class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :users_categories, dependent: :destroy
  has_many :categories, through: :categories_users, dependent: :destroy
  validates :birthday, :username, presence:true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
