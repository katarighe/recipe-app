# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'Adam' }
    email { 'adam@mail.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
