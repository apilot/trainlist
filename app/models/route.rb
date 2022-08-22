class Route < ApplicationRecord
  has_and_belongs_to_many :stations
  has_many :trains
end
