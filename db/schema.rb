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

ActiveRecord::Schema[7.0].define(version: 2022_08_17_114947) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "car_status", ["free", "chained"]

  create_table "cars", force: :cascade do |t|
    t.integer "number"
    t.integer "type_of", default: 0
    t.bigint "train_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["train_id"], name: "index_cars_on_train_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes_stations", id: false, force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "station_id"
    t.index ["route_id"], name: "index_routes_stations_on_route_id"
    t.index ["station_id"], name: "index_routes_stations_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_stations_on_route_id"
  end

  create_table "trains", force: :cascade do |t|
    t.integer "number"
    t.integer "car_max"
    t.integer "type_of", default: 0
    t.bigint "route_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_trains_on_route_id"
    t.index ["station_id"], name: "index_trains_on_station_id"
  end

  add_foreign_key "cars", "trains"
  add_foreign_key "trains", "stations"
end
