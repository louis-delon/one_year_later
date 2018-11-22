class Objective < ApplicationRecord
  belongs_to :state
  has_many :actions, dependent: :destroy
  validates :title, :description, :deadline, presence: true
end
