class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :vote_status, :user_id, :votable_id, :votable_type, presence: true
  validates :user_id, uniqueness: {scope: [:votable_id, :votable_type]}
  validates :vote_status
end
