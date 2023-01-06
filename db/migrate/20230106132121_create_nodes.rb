class CreateNodes < ActiveRecord::Migration[7.0]
  def change
    create_table :nodes do |t|
      t.references :graph, null: false, foreign_key: true
      t.references :node_type, null: false, foreign_key: true
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
