require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) do
    FactoryBot.create(:user, name: 'Abdul Wahab', email: 'wahab@gmail.com', password: 'root17',
                             password_confirmation: 'root17')
  end

  let(:inventory) do
    FactoryBot.create(:inventory, name: 'Abdul Wahab', user_id: user.id, description: 'Nice')
  end

  let(:food) do
    FactoryBot.create(:food, name: 'Grapes', measurement_unit: 'g', price: 1.15, user_id: user.id)
  end

  let(:inventory_food) do
    FactoryBot.create(:inventory_food, quantity: 5, food_id: food.id, inventory_id: inventory.id)
  end

  context 'Validate' do
    it 'should have a valid attribute' do
      expect(inventory_food).to be_valid
    end

    it 'should be invalid if no quantity has been added' do
      inventory_food.quantity = ''

      expect(inventory_food).to_not be_valid
    end

    it 'should be invalid if the quantity value is 0' do
      inventory_food.quantity = 0

      expect(inventory_food).to_not be_valid
    end

    it 'should be invalid without a food id' do
      inventory_food.food_id = ''

      expect(inventory_food).to_not be_valid
    end

    it 'should be invalid without the inventory id' do
      inventory_food.inventory_id = ''

      expect(inventory_food).to_not be_valid
    end
  end
end