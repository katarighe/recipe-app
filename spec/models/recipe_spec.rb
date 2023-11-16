require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) do
    FactoryBot.create(:user, name: 'Pedro Guerreiro', email: 'pedro@domain.com', password: '123456',
                             password_confirmation: '123456')
  end

  let(:recipe) do
    FactoryBot.create(:recipe, name: 'French macaroons', preparation_time_hours: '1.00', cooking_time_hours: '1.50',
                               description: 'Delicious snack', public: true,
                               user_id: user.id)
  end

  describe 'validate Recipe Data' do
    it 'should be valid with valid attributes' do
      expect(recipe).to be_valid
    end

    it 'should be invalid without a name' do
      recipe.name = nil

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with a description under 1 character and over 200 characters' do
      recipe.description = ''

      expect(recipe).to_not be_valid

      recipe.description = 'a' * 201

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with without a public value' do
      recipe.public = nil

      expect(recipe).to_not be_valid
    end
  end

  context 'preparation_time_hours and cooking_time_hours columns' do
    it 'should be invalid without a preparation time (in hours)' do
      recipe.preparation_time_hours = nil

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with a preparation time (in hours) under 0.01' do
      recipe.preparation_time_hours = 0

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with a preparation time (in hours) over 2880' do
      recipe.preparation_time_hours = 1441

      expect(recipe).to_not be_valid
    end

    it 'should be invalid without a cooking time (in hours)' do
      recipe.cooking_time_hours = nil

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with a cooking time under 0.01' do
      recipe.cooking_time_hours = 0

      expect(recipe).to_not be_valid
    end

    it 'should be invalid with a cooking time over 2880' do
      recipe.cooking_time_hours = 1441

      expect(recipe).to_not be_valid
    end
  end
end
