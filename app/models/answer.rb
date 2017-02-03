class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :answer, :user_id, :question_id, presence: true

  def all_votes
    self.votes.sum(:vote_status)
  end
end
