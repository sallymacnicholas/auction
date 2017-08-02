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

ActiveRecord::Schema.define(version: 20170124193044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_washes", force: :cascade do |t|
    t.integer "store_id"
    t.boolean "hot_wax"
    t.boolean "full_detail"
    t.index ["store_id"], name: "car_washes_store_id_key", unique: true, using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string  "name",          limit: 255
    t.boolean "allows_drones"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_favorites_on_item_id", using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "business_name"
    t.string   "contact_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.integer  "retail_value"
    t.boolean  "delivery"
    t.boolean  "archived",           default: false
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "salsas", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "stores", force: :cascade do |t|
    t.string  "name",         limit: 255
    t.integer "city_id"
    t.boolean "sells_beer"
    t.integer "zagat_rating"
  end

  create_table "stores_salsas", force: :cascade do |t|
    t.integer "store_id"
    t.integer "salsa_id"
    t.integer "spiciness"
  end

  create_table "stores_tacos", force: :cascade do |t|
    t.integer "store_id"
    t.integer "taco_id"
    t.decimal "price",    precision: 6, scale: 2
  end

  create_table "tacos", force: :cascade do |t|
    t.string  "name",       limit: 255
    t.boolean "vegetarian"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "car_washes", "stores", name: "car_washes_store_id_fkey"
  add_foreign_key "favorites", "items"
  add_foreign_key "favorites", "users"
  add_foreign_key "items", "users"
  add_foreign_key "stores", "cities", name: "stores_city_id_fkey"
  add_foreign_key "stores_salsas", "salsas", name: "stores_salsas_salsa_id_fkey"
  add_foreign_key "stores_salsas", "stores", name: "stores_salsas_store_id_fkey"
  add_foreign_key "stores_tacos", "stores", name: "stores_tacos_store_id_fkey"
  add_foreign_key "stores_tacos", "tacos", name: "stores_tacos_taco_id_fkey"
end
