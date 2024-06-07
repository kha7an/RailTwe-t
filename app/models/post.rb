class Post < ApplicationRecord
  acts_as_votable

  has_many :comments, dependent: :destroy

  belongs_to :user, foreign_key: 'user_id', optional: true

  validates :content, presence: true

  def voted_up_by?(user)
    self.votes_for.where(voter_id: user.id, vote_flag: true).any?
  end

end
