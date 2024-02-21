class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: {in: 3..16}, uniqueness: true
  validates :email, uniqueness: true
  validates :password, length: {minimum: 5}
  validates :name, presence: true
  validates :surname, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

end
