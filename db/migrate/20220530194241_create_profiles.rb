class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
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
  end
end
