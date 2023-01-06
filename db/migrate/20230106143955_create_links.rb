class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.references :graph, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: {to_table: :nodes}
      t.references :target, null: false, foreign_key: {to_table: :nodes}

      t.timestamps
    end
  end
end
