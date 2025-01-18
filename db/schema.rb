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

ActiveRecord::Schema[8.0].define(version: 2025_01_18_201722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entity_resources", force: :cascade do |t|
    t.string "entity_type", null: false
    t.bigint "entity_id", null: false
    t.string "resource_type", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id", "entity_type", "resource_id", "resource_type"], name: "index_entity_resources_unique", unique: true
    t.index ["entity_type", "entity_id"], name: "index_entity_resources_on_entity"
    t.index ["resource_type", "resource_id"], name: "index_entity_resources_on_resource"
  end

  create_table "entity_traits", force: :cascade do |t|
    t.string "entity_type", null: false
    t.bigint "entity_id", null: false
    t.bigint "trait_id", null: false
    t.boolean "core_trait", default: false
    t.integer "base_value"
    t.integer "cached_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_entity_traits_on_entity"
    t.index ["trait_id"], name: "index_entity_traits_on_trait_id"
  end

  create_table "gears", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "weight"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "target_type", null: false
    t.bigint "target_id", null: false
    t.string "source_type", null: false
    t.bigint "source_id", null: false
    t.integer "modifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_type", "source_id"], name: "index_entity_modifiers_on_source"
    t.index ["target_type", "target_id"], name: "index_entity_modifiers_on_target"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_order"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.integer "damage_dice"
    t.integer "damage_dice_qty"
    t.integer "ammo"
    t.integer "range"
    t.integer "quality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "entity_traits", "traits"
end
