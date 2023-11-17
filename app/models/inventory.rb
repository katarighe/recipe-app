# frozen_string_literal: true

class Inventory < ApplicationRecord
  belongs_to :user
  has_many :inventory_foods, dependent: :destroy

  validates :name, presence: true
end
