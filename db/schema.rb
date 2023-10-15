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

ActiveRecord::Schema[7.1].define(version: 2023_10_14_175815) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ip_addresses", force: :cascade do |t|
    t.inet "ip"
    t.string "area_code"
    t.string "country"
    t.string "country_code"
    t.string "country_code3"
    t.string "continent_code"
    t.string "city"
    t.string "region"
    t.string "latitude"
    t.string "longitude"
    t.integer "accuracy"
    t.string "timezone"
    t.string "organization_name"
    t.integer "asn"
    t.string "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
