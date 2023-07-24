# frozen_string_literal: true

class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.references :target, polymorphic: true
      t.string :token, null: false
      t.integer :os, null: false
      t.timestamps
    end
  end
end
