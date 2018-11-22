class Action < ApplicationRecord
  belongs_to :objective
  validates :title, :description, :deadline, presence: true
end
