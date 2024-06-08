class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {basic: 0, moderator: 1, admin: 2 }, _suffix: :role

  validates :username, length: { in: 3..16 }, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 5 }, allow_nil: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  has_one_attached :avatar

  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

  def avatar_url
    rails_blob_path(avatar, only_path: true) if avatar.attached?
  end
end
