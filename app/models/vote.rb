class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphism: true

  validates :vote_status, :user_id, :votable_id, :votable_type, presence: true
  validates :user_id, uniqueness: true, { scope: [:voteable_id, :voteable_type] }
end
