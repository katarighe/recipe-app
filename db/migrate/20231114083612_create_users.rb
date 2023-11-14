# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: 'User', limit: 50

      t.timestamps
    end
  end
end
