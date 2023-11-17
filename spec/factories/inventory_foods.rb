# frozen_string_literal: true

FactoryBot.define do
  factory :inventory_food do
    quantity { 1 }
    inventory_id { nil }
    food_id { nil }
  end
end
