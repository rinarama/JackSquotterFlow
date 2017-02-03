class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  validates :comment, :user_id, :commentable_id, :commentable_type, presence: true

  def all_votes
    self.votes.sum(:vote_status)
  end
end
