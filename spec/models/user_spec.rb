require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    FactoryBot.create(:user,
                      name: 'Adam',
                      email: 'adam@mail.com',
                      password: 'password',
                      password_confirmation: 'password')
  end

  describe 'validate data: ' do
    it 'name should be present' do
      user.name = ''
      expect(user).to_not be_valid
    end

    it 'name should be present' do
      user.name = 'John'
      expect(user).to be_valid
    end

    it 'name length should not be greate than 100 characters' do
      user.name = 'John' * 26
      expect(user).to_not be_valid
    end
  end
end