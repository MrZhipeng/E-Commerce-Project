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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_163058) do
  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.decimal "on_sale_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "platform_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id"], name: "index_products_on_genre_id"
    t.index ["platform_id"], name: "index_products_on_platform_id"
  end

  add_foreign_key "products", "genres"
  add_foreign_key "products", "platforms"
end
