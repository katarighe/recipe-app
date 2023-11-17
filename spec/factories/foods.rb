FactoryBot.define do
  factory :food do
    name { 'Chicken breasts' }
    measurement_unit { 'pcs' }
    price_dollars { 9.99 }
    user { 1 }
  end
end
