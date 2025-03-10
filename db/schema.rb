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

ActiveRecord::Schema.define(version: 10) do

  create_table "celebrities", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "known_for"
  end

  create_table "celebrity_interests", force: :cascade do |t|
    t.integer "interest_id"
    t.integer "celebrity_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "interest_names"
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer "interest_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

end
