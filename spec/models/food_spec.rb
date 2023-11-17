require 'rails_helper'

RSpec.describe Food, type: :model do
  User.new(name: 'charles')
  food = Food.new(
    name: 'Rice',
    measurement_unit: 'kg',
    price_dollars: 5.99
  )
  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(food).to be_valid
    end

    it 'is not valid without a name' do
      food.name = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      food.measurement_unit = nil
      expect(food).to_not be_valid
    end

    it 'is not valid without a price (in dollars)' do
      food.price_dollars = nil
      expect(food).to_not be_valid
    end
  end
end