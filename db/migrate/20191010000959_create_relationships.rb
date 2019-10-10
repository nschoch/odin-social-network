class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :friender_id
      t.integer :friendee_id

      t.timestamps
    end
    add_index :relationships, :friender_id
    add_index :relationships, :friendee_id
    add_index :relationships, [:friender_id, :friendee_id], unique: true
  end
end
