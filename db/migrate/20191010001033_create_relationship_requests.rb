class CreateRelationshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_requests do |t|
      t.integer :requester_id
      t.integer :requestee_id

      t.timestamps
    end
    add_index :relationship_requests, :requester_id
    add_index :relationship_requests, :requestee_id
    add_index :relationship_requests, [:requester_id, :requestee_id], unique: true
  end
end
