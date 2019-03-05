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

ActiveRecord::Schema.define(version: 2019_02_19_063621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "corrects", force: :cascade do |t|
    t.string "list"
    t.bigint "liste_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liste_id"], name: "index_corrects_on_liste_id"
  end

  create_table "liens", force: :cascade do |t|
    t.string "liengit"
    t.bigint "liste_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["liste_id"], name: "index_liens_on_liste_id"
    t.index ["student_id"], name: "index_liens_on_student_id"
  end

  create_table "listes", force: :cascade do |t|
    t.string "lejour"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.string "firstname"
    t.string "lastname", default: " "
    t.string "email"
    t.integer "age"
    t.string "datenais"
    t.string "ville"
    t.integer "note1", default: 0
    t.integer "note2", default: 0
    t.integer "correcteur1", default: 0
    t.integer "correcteur2", default: 0
    t.boolean "noted1", default: true
    t.boolean "noted2", default: true
    t.boolean "noted", default: true
    t.integer "joker", default: 3
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
