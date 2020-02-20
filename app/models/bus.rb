class Bus < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bus_options

  has_many :options, through: :bus_options

  validates :description, presence: true
  validates :price, presence: true
  validates :capacity, presence: true, inclusion: 1..56
  validates :name, presence: true
end
