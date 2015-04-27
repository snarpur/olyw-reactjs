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

ActiveRecord::Schema.define(version: 20150427151715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reports", force: true do |t|
    t.integer  "location"
    t.integer  "year"
    t.integer  "month"
    t.decimal  "average_temperature",           precision: 5, scale: 1
    t.decimal  "average_high_temperature",      precision: 5, scale: 1
    t.decimal  "highest_temperature",           precision: 5, scale: 1
    t.integer  "date_of_highest_temperature"
    t.decimal  "average_low_temperature",       precision: 5, scale: 1
    t.decimal  "lowest_temperature",            precision: 5, scale: 1
    t.integer  "date_of_lowest_temperature"
    t.decimal  "average_humidity",              precision: 5, scale: 1
    t.decimal  "total_percipitation",           precision: 5, scale: 1
    t.decimal  "highest_percipitation",         precision: 5, scale: 1
    t.integer  "date_of_highest_percipitation"
    t.decimal  "average_pressure",              precision: 5, scale: 1
    t.decimal  "average_cloud",                 precision: 5, scale: 1
    t.decimal  "hours_of_sunshine",             precision: 5, scale: 1
    t.decimal  "average_wind",                  precision: 5, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
