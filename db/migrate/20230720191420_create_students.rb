# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.timestamps
    end

    add_index :students, :email, unique: true
  end
end
