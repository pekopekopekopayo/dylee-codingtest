# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_722_125_408) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'black_lists', force: :cascade do |t|
    t.string 'name'
    t.inet 'ip_address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ip_address'], name: 'index_black_lists_on_ip_address', unique: true
  end

  create_table 'devices', force: :cascade do |t|
    t.string 'target_type'
    t.bigint 'target_id'
    t.string 'token', null: false
    t.integer 'os', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[target_type target_id], name: 'index_devices_on_target'
  end

  create_table 'lessons', force: :cascade do |t|
    t.integer 'student_id'
    t.integer 'teacher_id'
    t.datetime 'started_at', null: false
    t.datetime 'ended_at', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'students', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_students_on_email', unique: true
  end

  create_table 'teachers', force: :cascade do |t|
    t.string 'email', null: false
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_teachers_on_email', unique: true
  end
end
