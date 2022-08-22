class Train < ApplicationRecord
  include Typeof
  belongs_to :route
  has_many :cars

  validate :validate_cars

  def validate_cars
    errors.add(:cars, "too mutch") if cars.size > car_max
  end
end
