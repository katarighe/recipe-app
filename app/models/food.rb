class Food < ApplicationRecord
  belongs_to :user

  validates: :name presence: true, length: {maximum: 250}
  validates: :price_dollars presence: true
  validates: :measurement_unit, presence: true, inclusion: { in: %w( kilograms ), message: "%{value} is not a valid measurement unit" }
end
