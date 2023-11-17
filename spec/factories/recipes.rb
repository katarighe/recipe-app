# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name { 'MyString' }
    preparation_time_hours { 1.00 }
    cooking_time_hours { 1.00 }
    description { 'MyText' }
    public { false }
  end
end
