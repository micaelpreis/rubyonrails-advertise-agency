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

ActiveRecord::Schema.define(version: 20160903154350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "banners_campaigns", id: false, force: :cascade do |t|
    t.integer "campaign_id", null: false
    t.integer "banner_id",   null: false
  end

  add_index "banners_campaigns", ["banner_id", "campaign_id"], name: "index_banners_campaigns_on_banner_id_and_campaign_id", using: :btree
  add_index "banners_campaigns", ["campaign_id", "banner_id"], name: "index_banners_campaigns_on_campaign_id_and_banner_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clicks", force: :cascade do |t|
    t.integer  "banner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "campaign_id"
  end

  add_index "clicks", ["banner_id"], name: "index_clicks_on_banner_id", using: :btree
  add_index "clicks", ["campaign_id"], name: "index_clicks_on_campaign_id", using: :btree

  create_table "conversions", force: :cascade do |t|
    t.integer  "click_id"
    t.float    "revenue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conversions", ["click_id"], name: "index_conversions_on_click_id", using: :btree

  add_foreign_key "clicks", "banners"
  add_foreign_key "clicks", "campaigns"
  add_foreign_key "conversions", "clicks"
end
