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

ActiveRecord::Schema.define(version: 20171208180439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "rut"
    t.float    "money"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.string   "colour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "player_colour_picked"
    t.float    "player_money_bet"
    t.integer  "player_id"
    t.integer  "round_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "player_money_owned"
  end

  add_index "tickets", ["game_id"], name: "index_tickets_on_game_id", using: :btree
  add_index "tickets", ["player_id"], name: "index_tickets_on_player_id", using: :btree
  add_index "tickets", ["round_id"], name: "index_tickets_on_round_id", using: :btree

end
