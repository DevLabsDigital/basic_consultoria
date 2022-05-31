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

ActiveRecord::Schema.define(version: 2022_05_31_132043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "consultoria_attachments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "consultoria_card_id", null: false
    t.string "file"
    t.string "file_name"
    t.string "file_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_card_id"], name: "index_consultoria_attachments_on_consultoria_card_id"
  end

  create_table "consultoria_boards", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.datetime "deleted_at"
    t.boolean "is_inactive", default: false
    t.bigint "consultoria_category_id"
    t.boolean "is_private"
    t.bigint "creator_id"
    t.integer "position"
    t.index ["consultoria_category_id"], name: "index_consultoria_boards_on_consultoria_category_id"
  end

  create_table "consultoria_card_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "consultoria_card_id", null: false
    t.string "kind"
    t.string "alteration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_card_id"], name: "index_consultoria_card_histories_on_consultoria_card_id"
    t.index ["user_id"], name: "index_consultoria_card_histories_on_user_id"
  end

  create_table "consultoria_cards", force: :cascade do |t|
    t.bigint "consultoria_list_id", null: false
    t.string "title"
    t.string "status"
    t.text "description"
    t.string "files"
    t.integer "position", default: 0, null: false
    t.date "start_date"
    t.date "finish_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_conclusion"
    t.bigint "user_id"
    t.index ["consultoria_list_id"], name: "index_consultoria_cards_on_consultoria_list_id"
    t.index ["user_id"], name: "index_consultoria_cards_on_user_id"
  end

  create_table "consultoria_categories", force: :cascade do |t|
    t.string "title"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  create_table "consultoria_checklists", force: :cascade do |t|
    t.string "title"
    t.bigint "consultoria_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_card_id"], name: "index_consultoria_checklists_on_consultoria_card_id"
  end

  create_table "consultoria_comments", force: :cascade do |t|
    t.bigint "consultoria_card_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "consultoria_comment_id"
    t.index ["consultoria_card_id"], name: "index_consultoria_comments_on_consultoria_card_id"
    t.index ["user_id"], name: "index_consultoria_comments_on_user_id"
  end

  create_table "consultoria_daily_mails", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "company_name", default: ""
    t.jsonb "subjects", default: {}
  end

  create_table "consultoria_lists", force: :cascade do |t|
    t.bigint "consultoria_board_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_board_id"], name: "index_consultoria_lists_on_consultoria_board_id"
  end

  create_table "consultoria_protocols", force: :cascade do |t|
    t.bigint "consultoria_board_id", null: false
    t.date "meeting_date"
    t.string "meeting_time"
    t.string "meeting_place"
    t.string "meeting_goal"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["consultoria_board_id"], name: "index_consultoria_protocols_on_consultoria_board_id"
    t.index ["user_id"], name: "index_consultoria_protocols_on_user_id"
  end

  create_table "consultoria_taggings", force: :cascade do |t|
    t.bigint "consultoria_tag_id", null: false
    t.bigint "consultoria_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_card_id"], name: "index_consultoria_taggings_on_consultoria_card_id"
    t.index ["consultoria_tag_id"], name: "index_consultoria_taggings_on_consultoria_tag_id"
  end

  create_table "consultoria_tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "consultoria_board_id", null: false
    t.integer "position"
    t.index ["consultoria_board_id"], name: "index_consultoria_tags_on_consultoria_board_id"
  end

  create_table "consultoria_tasks", force: :cascade do |t|
    t.bigint "consultoria_checklist_id", null: false
    t.text "description"
    t.boolean "completed"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_checklist_id"], name: "index_consultoria_tasks_on_consultoria_checklist_id"
  end

  create_table "consultoria_user_boards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "consultoria_board_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consultoria_board_id"], name: "index_consultoria_user_boards_on_consultoria_board_id"
    t.index ["user_id"], name: "index_consultoria_user_boards_on_user_id"
  end

  create_table "consultoria_user_cards", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "consultoria_card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "lead"
    t.boolean "is_main", default: false
    t.index ["consultoria_card_id"], name: "index_consultoria_user_cards_on_consultoria_card_id"
    t.index ["user_id"], name: "index_consultoria_user_cards_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "company_id"
    t.bigint "role_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf"
    t.string "phone"
    t.string "picture"
    t.index ["company_id"], name: "index_profiles_on_company_id"
    t.index ["role_id"], name: "index_profiles_on_role_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email_hash"
    t.string "user_scope", default: "company_user"
    t.string "role"
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.boolean "allow_password_change", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.json "tokens"
    t.string "avatar", default: ""
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "consultoria_attachments", "consultoria_cards"
  add_foreign_key "consultoria_boards", "consultoria_categories"
  add_foreign_key "consultoria_card_histories", "consultoria_cards"
  add_foreign_key "consultoria_card_histories", "users"
  add_foreign_key "consultoria_cards", "consultoria_lists"
  add_foreign_key "consultoria_cards", "users"
  add_foreign_key "consultoria_checklists", "consultoria_cards"
  add_foreign_key "consultoria_comments", "consultoria_cards"
  add_foreign_key "consultoria_comments", "users"
  add_foreign_key "consultoria_lists", "consultoria_boards"
  add_foreign_key "consultoria_protocols", "consultoria_boards"
  add_foreign_key "consultoria_protocols", "users"
  add_foreign_key "consultoria_taggings", "consultoria_cards"
  add_foreign_key "consultoria_taggings", "consultoria_tags"
  add_foreign_key "consultoria_tags", "consultoria_boards"
  add_foreign_key "consultoria_tasks", "consultoria_checklists"
  add_foreign_key "consultoria_user_boards", "consultoria_boards"
  add_foreign_key "consultoria_user_boards", "users"
  add_foreign_key "consultoria_user_cards", "consultoria_cards"
  add_foreign_key "consultoria_user_cards", "users"
end
