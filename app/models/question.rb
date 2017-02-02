class Question < ActiveRecord::Base
  belongs_to :user
  has_one :best_answer, class_name: :answer, foreign_key: :question_id
  has_many :answers
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  validates :title, :content, :user_id, presence: true

  def all_votes
    self.votes.sum(:value)
  end
end
