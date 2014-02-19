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

ActiveRecord::Schema.define(version: 20140219194046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "keys", force: true do |t|
    t.string   "keyid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "signatures", force: true do |t|
    t.integer  "signed_key_id"
    t.integer  "signing_key_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signatures", ["signed_key_id"], name: "index_signatures_on_signed_key_id", using: :btree
  add_index "signatures", ["signing_key_id"], name: "index_signatures_on_signing_key_id", using: :btree

  create_table "statuses", force: true do |t|
    t.integer  "key_id"
    t.text     "body"
    t.text     "signed_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statuses", ["key_id"], name: "index_statuses_on_key_id", using: :btree

end
