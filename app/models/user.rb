class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true,
                                     format: { with: /\A[a-zA-Z]+\z/, message: "should only allow letters" }

  has_many :posts, dependent: :destroy

  has_many :friend_requests, { class_name: :RelationshipRequest, foreign_key: :requester_id, dependent: :destroy }
  has_many :relationship_requests, { class_name: :RelationshipRequest, foreign_key: :requester_id, dependent: :destroy }
  has_many :friend_requests_received, { class_name: :RelationshipRequest, foreign_key: :requestee_id, dependent: :destroy }
  has_many :relationship_requests_received, { class_name: :RelationshipRequest, foreign_key: :requestee_id, dependent: :destroy }
  has_many :pending_friends, { through: :friend_requests, source: :requestee }
  has_many :pending_friends_inverse, { through: :friend_requests_received, source: :requester }

  has_many :friendships, { class_name: :Relationship, foreign_key: :friender_id, dependent: :destroy }
  has_many :inverse_friendships, { class_name: :Relationship, foreign_key: :friendee_id, dependent: :destroy }
  has_many :friends_as_requester, { through: :friendships, source: :friendee }
  has_many :friends_as_requestee, { through: :inverse_friendships, source: :friender }

  before_save :capitalize_first_and_last_name
  before_save :downcase_email

  def feed 
    Post.where("user_id IN (?) OR user_id = ?", friends.pluck(:id), id)
  end

  def full_name
    first_name + " " + last_name
  end

  def friends
    friends_as_requestee + friends_as_requester
  end

  def specific_friendship_with(user)
    friendships.find_by(friendee: user) || inverse_friendships.find_by(friender: user)
  end

  private

    def capitalize_first_and_last_name
      first_name.capitalize!
      last_name.capitalize!
    end

    def downcase_email
      email.downcase!
    end

end
