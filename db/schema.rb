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

ActiveRecord::Schema.define(version: 2020_08_19_014725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "industry"
    t.text "address"
    t.text "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_configurations", force: :cascade do |t|
    t.time "work_start"
    t.time "work_end"
    t.jsonb "working_day"
    t.jsonb "service_type"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_configurations_on_company_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.integer "ticket_number"
    t.boolean "priority"
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tickets_on_company_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_user_companies_on_company_id"
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "phone"
    t.string "email"
    t.integer "role"
    t.date "birthday"
    t.boolean "critical_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "company_configurations", "companies"
  add_foreign_key "tickets", "companies"
  add_foreign_key "tickets", "users"
  add_foreign_key "user_companies", "companies"
  add_foreign_key "user_companies", "users"
end
