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

ActiveRecord::Schema.define(version: 2022_03_31_095056) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "products_id"
    t.integer "orders_id"
    t.integer "quantity"
    t.integer "discounted_price"
    t.index ["orders_id"], name: "index_order_products_on_orders_id"
    t.index ["products_id"], name: "index_order_products_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customers_id"
    t.integer "order_number"
    t.float "total_cost"
    t.string "status", default: "placed"
    t.text "delivery_details", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["customers_id"], name: "index_orders_on_customers_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.string "code"
    t.float "ratail_price"
    t.float "wholesale_price"
    t.float "purchase_price"
    t.integer "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "role"
    t.string "password_digest"
  end

end
