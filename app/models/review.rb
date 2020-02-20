class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bus

  validates :description, presence: true
  validates :note, inclusion: 1..10
end
