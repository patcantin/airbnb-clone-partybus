class Bus < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :bus_options, dependent: :destroy

  has_many :options, through: :bus_options

  validates :description, presence: true
  validates :price, presence: true
  validates :capacity, presence: true, inclusion: 1..56
  validates :name, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :description, :capacity, :price],
    associated_against: {
      options: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
