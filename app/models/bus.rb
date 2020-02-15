class Bus < ApplicationRecord
  has_one_attached :photo
  belongs_to :user

  validates :description, presence: true
  validates :price, presence: true
  validates :capacity, presence: true, inclusion: 1..56
  validates :name, presence: true
end
