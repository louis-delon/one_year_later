class Category < ApplicationRecord

  has_many :categories_users, dependent: :destroy
  has_many :users, through: :categories_users
  validates :name, :weigth, presence: true

end
