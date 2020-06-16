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

ActiveRecord::Schema.define(version: 2020_06_16_144733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.citext "category", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "unique_category", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.text "postal_address"
    t.integer "work_telephone"
    t.integer "home_telephone"
    t.integer "fax"
    t.integer "mobile"
    t.string "email"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_contacts_on_person_id"
    t.index ["person_id"], name: "one_contacts_for_one_person", unique: true
  end

  create_table "employment_histories", force: :cascade do |t|
    t.string "employer", null: false
    t.string "position_held", null: false
    t.text "key_performance_areas"
    t.date "date_from"
    t.date "date_to"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_employment_histories_on_person_id"
  end

  create_table "essays", force: :cascade do |t|
    t.text "understanding_nipam_role"
    t.text "candidate_suitability"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_essays_on_person_id"
    t.index ["person_id"], name: "one_essay_for_one_person", unique: true
  end

  create_table "facility_useds", force: :cascade do |t|
    t.string "facility"
    t.bigint "visit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visit_id"], name: "index_facility_useds_on_visit_id"
  end

  create_table "fields", force: :cascade do |t|
    t.citext "field", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field"], name: "unique_field", unique: true
  end

  create_table "language_proficiencies", force: :cascade do |t|
    t.string "language", null: false
    t.integer "read", null: false
    t.integer "write", null: false
    t.integer "speak", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_language_proficiencies_on_person_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "title"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "dob"
    t.string "id_passport_number", null: false
    t.string "citizenship", null: false
    t.string "permit_type"
    t.citext "permit_number"
    t.date "permit_expiry_date"
    t.string "residential_address"
    t.bigint "sector_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_passport_number"], name: "unique_citizen_passport_id", unique: true
    t.index ["sector_id"], name: "index_people_on_sector_id"
  end

  create_table "professional_memberships", force: :cascade do |t|
    t.string "body_name", null: false
    t.integer "registration_number"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_professional_memberships_on_person_id"
  end

  create_table "qualifications", force: :cascade do |t|
    t.string "qual_obtained", null: false
    t.string "institution", null: false
    t.text "courses_passed"
    t.text "major_subjects"
    t.integer "nqf_level"
    t.date "date_from"
    t.date "date_to"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_qualifications_on_person_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.integer "mobile"
    t.integer "telephone"
    t.string "employer", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_references_on_person_id"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "sector", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skill_types", force: :cascade do |t|
    t.citext "type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_name"], name: "unique_type", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "skill_type_id", null: false
    t.integer "rating", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_skills_on_person_id"
    t.index ["skill_type_id"], name: "index_skills_on_skill_type_id"
  end

  create_table "specialisations", force: :cascade do |t|
    t.bigint "field_id", null: false
    t.string "level", null: false
    t.string "station_duty", null: false
    t.bigint "category_id"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_specialisations_on_category_id"
    t.index ["field_id"], name: "index_specialisations_on_field_id"
    t.index ["person_id"], name: "index_specialisations_on_person_id"
  end

  create_table "users", force: :cascade do |t|
    t.citext "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "visitors", force: :cascade do |t|
    t.string "name"
    t.integer "contact_number"
    t.string "loc_org"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.float "temperature"
    t.date "time"
    t.string "purpose"
    t.bigint "visitor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["visitor_id"], name: "index_visits_on_visitor_id"
  end

  add_foreign_key "contacts", "people"
  add_foreign_key "employment_histories", "people"
  add_foreign_key "essays", "people"
  add_foreign_key "facility_useds", "visits"
  add_foreign_key "language_proficiencies", "people"
  add_foreign_key "people", "sectors"
  add_foreign_key "professional_memberships", "people"
  add_foreign_key "qualifications", "people"
  add_foreign_key "references", "people"
  add_foreign_key "skills", "people"
  add_foreign_key "skills", "skill_types"
  add_foreign_key "specialisations", "categories"
  add_foreign_key "specialisations", "fields"
  add_foreign_key "specialisations", "people"
  add_foreign_key "visits", "visitors"
end
