class Review < ApplicationRecord
  belongs_to :user

  validates :description, presence: true
  validates :note, inclusion: 1..10
end
