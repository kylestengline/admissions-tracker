# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160216164839) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admission_officers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "ao_questionnaires", force: :cascade do |t|
    t.text    "course_goals"
    t.text    "comments"
    t.text    "reason_for_applying"
    t.integer "student_id"
    t.integer "admission_officer_id"
  end

  add_index "ao_questionnaires", ["admission_officer_id"], name: "index_ao_questionnaires_on_admission_officer_id", using: :btree
  add_index "ao_questionnaires", ["student_id"], name: "index_ao_questionnaires_on_student_id", using: :btree

  create_table "instructor_questionnaires", force: :cascade do |t|
    t.text    "strengths"
    t.text    "weaknesses"
    t.text    "comments"
    t.integer "instructor_id"
    t.integer "student_id"
  end

  add_index "instructor_questionnaires", ["instructor_id"], name: "index_instructor_questionnaires_on_instructor_id", using: :btree
  add_index "instructor_questionnaires", ["student_id"], name: "index_instructor_questionnaires_on_student_id", using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "course"
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.string  "course"
    t.text    "application_essay"
    t.string  "application_status",   default: "Phone Interview Pending"
    t.integer "instructor_id"
    t.integer "admission_officer_id"
    t.string  "phone_number"
    t.string  "picture"
  end

  add_index "students", ["admission_officer_id"], name: "index_students_on_admission_officer_id", using: :btree
  add_index "students", ["instructor_id"], name: "index_students_on_instructor_id", using: :btree

  add_foreign_key "ao_questionnaires", "admission_officers"
  add_foreign_key "ao_questionnaires", "students"
  add_foreign_key "instructor_questionnaires", "instructors"
  add_foreign_key "instructor_questionnaires", "students"
  add_foreign_key "students", "admission_officers"
  add_foreign_key "students", "instructors"
end
