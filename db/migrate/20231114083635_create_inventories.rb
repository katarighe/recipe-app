# frozen_string_literal: true

class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name, null: false, default: 'Inventory'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
