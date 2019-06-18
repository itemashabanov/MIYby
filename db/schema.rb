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

ActiveRecord::Schema.define(version: 20190617230204) do

  create_table "disciplines", id: false, force: :cascade do |t|
    t.string "discipline", null: false
    t.string "teacher"
    t.string "course"
    t.string "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline"], name: "index_disciplines_on_discipline"
    t.index ["specialty_id"], name: "index_disciplines_on_specialty_id"
  end

  create_table "groups", id: false, force: :cascade do |t|
    t.string "group", null: false
    t.string "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_groups_on_specialty_id"
  end

  create_table "search_suggestions", force: :cascade do |t|
    t.string "term"
    t.integer "popularity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", id: false, force: :cascade do |t|
    t.string "specialty", null: false
    t.string "specialization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty"], name: "index_specialties_on_specialty", unique: true
  end

  create_table "teaching_materials", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "discipline_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discipline_id"], name: "index_teaching_materials_on_discipline_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
