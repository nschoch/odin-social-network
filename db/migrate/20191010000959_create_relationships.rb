class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :friender_id
      t.integer :friendee_id

      t.timestamps
    end
  end
end
