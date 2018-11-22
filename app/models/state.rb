class State < ApplicationRecord
  belongs_to :category
  has_many :objectives, dependent: :destroy
  validates :title, :description, :note, :date, presence: true
end
