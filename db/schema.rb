# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_08_021855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "external_code", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "area_code", null: false
    t.string "number", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_customers_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "external_code"
    t.string "name"
    t.decimal "price"
    t.integer "quantity"
    t.decimal "total"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "external_code", null: false
    t.integer "store_id", null: false
    t.decimal "sub_total", null: false
    t.decimal "delivery_fee", null: false
    t.decimal "total_shipping", null: false
    t.decimal "total", null: false
    t.string "country", null: false
    t.string "state", null: false
    t.string "city", null: false
    t.string "district", null: false
    t.string "street", null: false
    t.string "complement", null: false
    t.decimal "latitude", precision: 10, scale: 6, null: false
    t.decimal "longitude", precision: 10, scale: 6, null: false
    t.datetime "dt_order_create", null: false
    t.string "postal_code", null: false
    t.integer "number", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.decimal "value"
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  add_foreign_key "customers", "orders"
  add_foreign_key "items", "orders"
  add_foreign_key "payments", "orders"
end
