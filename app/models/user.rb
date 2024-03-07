class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: {in: 3..16}, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 5}


  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  # def follow(user)
  #   followed_users << user
  # end
  #
  # def unfollow(user)
  #   followed_users.delete(user)
  # end
  #
  # def following?(user)
  #   followed_users.include?(user)
  # end

end
