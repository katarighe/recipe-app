require 'rails_helper'

RSpec.describe Inventory, type: :model do
  let(:user) do
    FactoryBot.create(:user, name: 'Abdul Wahab', email: 'oluyaratosin123@gmail.com', password: 'root17',
                             password_confirmation: 'root17')
  end

  let(:inventory) do
    FactoryBot.create(:inventory, name: 'Abdul Wahab', user_id: user.id, description: 'Test')
  end

  before { inventory.save }

  context 'Inventory models' do
    it 'should check for valid attributes' do
      expect(inventory).to be_valid
    end

    it 'should be invalid without name attribute' do
      inventory.name = ''

      expect(inventory).to_not be_valid
    end

    it 'should be invalid without the user id' do
      inventory.user_id = ''

      expect(inventory).to_not be_valid
    end
  end
end