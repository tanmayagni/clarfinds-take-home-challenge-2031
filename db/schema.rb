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

ActiveRecord::Schema[7.0].define(version: 2023_01_06_143955) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "graphs", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.bigint "graph_id", null: false
    t.bigint "source_id", null: false
    t.bigint "target_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graph_id"], name: "index_links_on_graph_id"
    t.index ["source_id"], name: "index_links_on_source_id"
    t.index ["target_id"], name: "index_links_on_target_id"
  end

  create_table "node_types", force: :cascade do |t|
    t.bigint "graph_id", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graph_id"], name: "index_node_types_on_graph_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.bigint "graph_id", null: false
    t.bigint "node_type_id", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graph_id"], name: "index_nodes_on_graph_id"
    t.index ["node_type_id"], name: "index_nodes_on_node_type_id"
  end

  add_foreign_key "links", "graphs"
  add_foreign_key "links", "nodes", column: "source_id"
  add_foreign_key "links", "nodes", column: "target_id"
  add_foreign_key "node_types", "graphs"
  add_foreign_key "nodes", "graphs"
  add_foreign_key "nodes", "node_types"
end
