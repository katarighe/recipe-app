class Food < ApplicationRecord
  belongs_to :user

  validates: :name presence: true, length: {maximum: 250}
  validates: :price_dollars presence: true, numericality: {greater_than: 0.0}
  validates: :measurement_unit presence: true
end
