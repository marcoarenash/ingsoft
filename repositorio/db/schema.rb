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

ActiveRecord::Schema.define(version: 20160928024938) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bmcs", force: :cascade do |t|
    t.text     "problema"
    t.text     "propuesta"
    t.text     "cliente"
    t.integer  "proyect_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bmcs", ["proyect_id"], name: "index_bmcs_on_proyect_id", using: :btree

  create_table "proyects", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "proyects", ["user_id"], name: "index_proyects_on_user_id", using: :btree

  create_table "pvs", force: :cascade do |t|
    t.text     "productos"
    t.text     "generadores"
    t.text     "eliminadores"
    t.text     "tareas"
    t.text     "ganancias"
    t.text     "frustaciones"
    t.integer  "proyect_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "pvs", ["proyect_id"], name: "index_pvs_on_proyect_id", using: :btree

  create_table "tvs", force: :cascade do |t|
    t.text     "hipcli"
    t.text     "hipprob"
    t.text     "hipsol"
    t.text     "invalidamos"
    t.text     "validamos"
    t.integer  "proyect_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tvs", ["proyect_id"], name: "index_tvs_on_proyect_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.boolean  "admin"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bmcs", "proyects"
  add_foreign_key "proyects", "users"
  add_foreign_key "pvs", "proyects"
  add_foreign_key "tvs", "proyects"
end
