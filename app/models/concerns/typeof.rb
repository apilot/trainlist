module Typeof
  extend ActiveSupport::Concern
  included do
    enum :type_of, {passenger: 0, cargo: 1}, default: :passenger
  end
  class_methods do
  end
end
