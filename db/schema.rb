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

ActiveRecord::Schema.define(version: 0) do

  create_table "courses", force: :cascade do |t|
    t.string "name"
  end

  create_table "groups", force: :cascade do |t|
    t.date     "date"
    t.datetime "datetime"
  end

  create_table "holes", force: :cascade do |t|
    t.integer "course_id"
    t.integer "number"
  end

  add_index "holes", ["course_id"], name: "index_holes_on_course_id"

  create_table "holescores", force: :cascade do |t|
    t.integer "hole_id"
    t.integer "round_id"
    t.integer "score_gross"
    t.integer "score_net"
    t.integer "tee_id"
  end

  add_index "holescores", ["hole_id"], name: "index_holescores_on_hole_id"
  add_index "holescores", ["round_id"], name: "index_holescores_on_round_id"
  add_index "holescores", ["tee_id"], name: "index_holescores_on_tee_id"

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "logo"
  end

  create_table "playerleagues", force: :cascade do |t|
    t.integer "player_id"
    t.integer "league_id"
    t.integer "league_points"
  end

  add_index "playerleagues", ["league_id"], name: "index_playerleagues_on_league_id"
  add_index "playerleagues", ["player_id"], name: "index_playerleagues_on_player_id"

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
    t.float   "handicap_index"
  end

  add_index "players", ["user_id"], name: "index_players_on_user_id"

  create_table "rounds", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "player_id"
    t.integer  "course_handicap"
    t.integer  "score_gross"
    t.integer  "score_net"
    t.float    "strokes_earned"
    t.date     "date"
    t.datetime "datetime"
    t.integer  "league_id"
    t.integer  "group_id"
    t.integer  "teeset_id"
  end

  add_index "rounds", ["course_id"], name: "index_rounds_on_course_id"
  add_index "rounds", ["group_id"], name: "index_rounds_on_group_id"
  add_index "rounds", ["league_id"], name: "index_rounds_on_league_id"
  add_index "rounds", ["player_id"], name: "index_rounds_on_player_id"
  add_index "rounds", ["teeset_id"], name: "index_rounds_on_teeset_id"

  create_table "tees", force: :cascade do |t|
    t.integer "hole_id"
    t.integer "handicap"
    t.integer "par"
    t.integer "yards"
    t.integer "teeset_id"
  end

  add_index "tees", ["hole_id"], name: "index_tees_on_hole_id"
  add_index "tees", ["teeset_id"], name: "index_tees_on_teeset_id"

  create_table "teesets", force: :cascade do |t|
    t.integer "course_id"
    t.string  "name"
    t.integer "yards"
    t.integer "slope"
    t.float   "rating"
  end

  add_index "teesets", ["course_id"], name: "index_teesets_on_course_id"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
