class Bus < ApplicationRecord
  belongs_to :user

  validate :description, presence: true
  validate :price, presence: true
  validate :capacity, presence: true, inclusion: 1..56
  validate :name, presence: true
end
