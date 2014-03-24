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

ActiveRecord::Schema.define(version: 20140324190428) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body",         null: false
    t.integer  "post_id",      null: false
    t.integer  "commenter_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interest_groups", force: true do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interest_groups", ["name"], name: "index_interest_groups_on_name", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.string   "title",             null: false
    t.text     "body",              null: false
    t.integer  "author_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interest_group_id"
  end

  create_table "user_interest_groups", force: true do |t|
    t.integer  "interest_group_id", null: false
    t.integer  "user_id",           null: false
    t.string   "user_type",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_interest_groups", ["interest_group_id"], name: "index_user_interest_groups_on_interest_group_id", using: :btree
  add_index "user_interest_groups", ["user_id"], name: "index_user_interest_groups_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "user_type"
    t.string   "fun_fact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
