class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.timestamps
    end
    add_index :teachers, :email, unique: true
  end
end