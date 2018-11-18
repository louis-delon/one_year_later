class Category < ApplicationRecord
  has_many :users_categories
  has_many :users, through: :categories_user
  validates :name, :weigth, presence: true

end
