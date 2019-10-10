class RelationshipRequest < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requestee, class_name: "User"

  validates :requester_id, presence: true
  validates :requestee_id, presence: true

  validates :requestee_id, uniqueness: { scope: :requester_id,
                                         message: ->(object, data) do
                                          "^#{object.requestee.first_name} has already been sent a friend request"
                                         end }
end
