class Option < ApplicationRecord
  has_many :bus_options
  has_many :bus, through: :bus_options
end
