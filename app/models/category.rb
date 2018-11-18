class Category < ApplicationRecord
  belongs_to :user
   validates :name, :weigth, presence: true

end
