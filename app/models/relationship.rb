class Relationship < ApplicationRecord

  belongs_to :friender, class_name: "User"
  belongs_to :friendee, class_name: "User"

  validates :friender_id, presence: true
  validates :friendee_id, presence: true

  def return_inverse_role(user)
    if user == friender
      friendee
    elsif user == friendee
      friender
    end
  end

end
