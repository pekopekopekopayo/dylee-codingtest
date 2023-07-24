class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.datetime :started_at, null: false
      t.datetime :ended_at, null: false
      t.timestamps
    end
  end
end
