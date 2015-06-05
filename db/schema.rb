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

ActiveRecord::Schema.define(version: 20150605150252) do

  create_table "products", force: true do |t|
    t.string   "name",       limit: 32
    t.string   "sku",        limit: 6
    t.string   "category",   limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category"], name: "index_products_on_category"
  add_index "products", ["name"], name: "index_products_on_name"
  add_index "products", ["sku"], name: "index_products_on_sku"

end