require 'rails_helper'

RSpec.describe Recipe, type: :model do
  @user = User.new(name: 'pepe', email: 'email1@email.com', password: 'abcdef')

  subject do
    Recipe.new(user: @user,
               name: 'Perfect Chicken',
               description: '',
               preparation_time_hours: 1.00,
               cooking_time_hours: 1.00)
  end

  before { subject.save }

  it 'should have an author' do
    subject.user = nil
    expect(subject).not_to be_valid
  end

  it 'should have a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid preparation time in hours' do
    subject.preparation_time_hours = nil
    expect(subject).not_to be_valid
  end

  it 'should have a valid cooking time in hours' do
    subject.preparation_time_hours = nil
    expect(subject).not_to be_valid
  end
end