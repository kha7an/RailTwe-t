class Post < ApplicationRecord
  acts_as_votable

  has_many :comments, dependent: :destroy

  belongs_to :user, foreign_key: 'user_id', optional: true
  belongs_to :user

  validates :content, presence: true

end
