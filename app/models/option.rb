class Option < ApplicationRecord
  has_many :buses, through: :bus_options
end
