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

ActiveRecord::Schema[7.2].define(version: 2026_06_02_143000) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "slot"
    t.integer "life_delta"
    t.integer "strength_delta"
    t.integer "xp_bonus"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_type"
    t.string "rarity"
    t.integer "price"
    t.json "stats"
    t.json "modifiers"
    t.text "description"
  end

  create_table "quest_rewards", force: :cascade do |t|
    t.integer "quest_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_quest_rewards_on_item_id"
    t.index ["quest_id"], name: "index_quest_rewards_on_quest_id"
  end

  create_table "quests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "reward_xp"
    t.boolean "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "riddles", force: :cascade do |t|
    t.integer "step_id", null: false
    t.text "question"
    t.text "answers"
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_riddles_on_step_id"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "quest_id", null: false
    t.integer "position"
    t.string "step_type"
    t.integer "reward_xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quest_id"], name: "index_steps_on_quest_id"
  end

  add_foreign_key "quest_rewards", "items"
  add_foreign_key "quest_rewards", "quests"
  add_foreign_key "riddles", "steps"
  add_foreign_key "steps", "quests"
end
