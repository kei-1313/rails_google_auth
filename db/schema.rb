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

ActiveRecord::Schema[8.0].define(version: 2025_03_02_052016) do
  create_table "battles", force: :cascade do |t|
    t.integer "host_user_id", null: false
    t.string "title", null: false
    t.datetime "apply_start_date", null: false
    t.datetime "apply_end_date", null: false
    t.datetime "battle_start_date", null: false
    t.datetime "battle_end_date", null: false
    t.integer "reword"
    t.text "detail", null: false
    t.integer "achievement_rate"
    t.integer "total_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_user_id"], name: "index_battles_on_host_user_id"
  end

  create_table "user_accounts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "auth_protocol", default: "oauth2"
    t.string "provider"
    t.string "provider_account_id"
    t.string "access_token"
    t.string "token_type", default: "Bearer"
    t.string "scope"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "battles", "users", column: "host_user_id"
  add_foreign_key "user_accounts", "users"
end
