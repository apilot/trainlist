class Car < ApplicationRecord
  include Typeof
  scope :unused, -> { where(train_id: nil) }
  scope :all_cars, ->(train) { where(type_of: train.type_of).where(train_id: [train.id, nil]) }
end
