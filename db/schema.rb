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

ActiveRecord::Schema.define(version: 20170428000151) do

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.integer  "hit_points"
    t.integer  "user_id"
    t.integer  "exp_gained"
    t.integer  "level"
    t.integer  "exp_yield"
    t.integer  "attack"
    t.integer  "defence"
    t.integer  "speed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "current_hit_points"
  end

  add_index "monsters", ["user_id"], name: "index_monsters_on_user_id"

  create_table "moves", force: :cascade do |t|
    t.string   "name"
    t.integer  "max_stamina"
    t.integer  "current_stamina"
    t.integer  "power"
    t.integer  "monster_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "moves", ["monster_id"], name: "index_moves_on_monster_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "gender"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
