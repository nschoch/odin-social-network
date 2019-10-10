class CreateRelationshipRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :relationship_requests do |t|
      t.integer :requester_id
      t.integer :requestee_id

      t.timestamps
    end
  end
end
