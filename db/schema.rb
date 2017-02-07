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

ActiveRecord::Schema.define(version: 20170207210329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_tags", force: :cascade do |t|
    t.integer "exercise_id"
    t.integer "tag_id"
    t.index ["exercise_id"], name: "index_exercise_tags_on_exercise_id", using: :btree
    t.index ["tag_id"], name: "index_exercise_tags_on_tag_id", using: :btree
  end

  create_table "exercises", force: :cascade do |t|
    t.text     "name"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "solution_id"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["solution_id"], name: "index_feedbacks_on_solution_id", using: :btree
    t.index ["user_id"], name: "index_feedbacks_on_user_id", using: :btree
  end

  create_table "solutions", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
    t.index ["exercise_id"], name: "index_solutions_on_exercise_id", using: :btree
    t.index ["user_id"], name: "index_solutions_on_user_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "census_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0
  end

  add_foreign_key "exercise_tags", "exercises"
  add_foreign_key "exercise_tags", "tags"
  add_foreign_key "feedbacks", "solutions"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "solutions", "exercises"
  add_foreign_key "solutions", "users"
end
