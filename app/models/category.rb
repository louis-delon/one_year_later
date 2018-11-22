class Category < ApplicationRecord

  has_many :categories_user
  has_many :users, through: :categories_user
  validates :name, :weigth, presence: true

end
