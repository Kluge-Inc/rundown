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

ActiveRecord::Schema.define(version: 20140703164345) do

  create_table "enties_in_leaflets", id: false, force: true do |t|
    t.integer "feed_entry_id"
    t.integer "leaflet_id"
  end

  create_table "feed_entries", force: true do |t|
    t.integer  "feed_id"
    t.string   "title"
    t.string   "url"
    t.datetime "published_at"
    t.string   "image_url"
    t.text     "summary"
    t.string   "original_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feed_entries", ["feed_id"], name: "index_feed_entries_on_feed_id"

  create_table "feeds", force: true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "leaflets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.integer  "postbox_id"
  end

  add_index "leaflets", ["postbox_id"], name: "index_leaflets_on_postbox_id"

  create_table "postboxes", force: true do |t|
    t.string   "email"
    t.integer  "periodity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "postboxes", ["user_id"], name: "index_postboxes_on_user_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "postbox_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["feed_id"], name: "index_subscriptions_on_feed_id"
  add_index "subscriptions", ["postbox_id"], name: "index_subscriptions_on_postbox_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
