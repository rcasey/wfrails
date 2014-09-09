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

ActiveRecord::Schema.define(version: 20140716204011) do

  create_table "companies", force: true do |t|
    t.string   "company_name", limit: 100
    t.integer  "operator_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "counties", force: true do |t|
    t.string   "county_name", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.string   "facility_name",    limit: 50
    t.integer  "facility_num"
    t.integer  "ground_elevation"
    t.decimal  "latitude",                    precision: 10, scale: 5, default: 0.0
    t.decimal  "longitude",                   precision: 10, scale: 5, default: 0.0
    t.string   "meridian",         limit: 5
    t.integer  "utm_x"
    t.integer  "utm_y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.integer  "county_id"
    t.integer  "field_id"
  end

  create_table "fields", force: true do |t|
    t.string   "field_name", limit: 100
    t.string   "field_code", limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields_formations", id: false, force: true do |t|
    t.integer "field_id",     null: false
    t.integer "formation_id", null: false
  end

  create_table "formations", force: true do |t|
    t.string   "formation",      limit: 100
    t.string   "formation_code", limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gastypes", force: true do |t|
    t.string   "gas_type",   limit: 25
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wells", force: true do |t|
    t.integer  "api_county_code"
    t.string   "api_num",          limit: 50
    t.integer  "api_seq_num"
    t.string   "dir_e_w",          limit: 10
    t.string   "dir_n_s",          limit: 10
    t.string   "dist_e_w",         limit: 10
    t.string   "dist_n_s",         limit: 10
    t.date     "first_prod_date"
    t.date     "form_status_date"
    t.string   "formation_status", limit: 10
    t.string   "qtrqtr",           limit: 6
    t.string   "range",            limit: 5
    t.integer  "sec"
    t.integer  "sidetrack_num"
    t.date     "spud_date"
    t.date     "status_date"
    t.date     "td_date"
    t.date     "test_date"
    t.string   "township",         limit: 10
    t.integer  "wb_meas_depth"
    t.integer  "wb_tvd"
    t.string   "well_bore_status", limit: 5
    t.string   "well_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "facility_id"
    t.integer  "gastype_id"
  end

end
