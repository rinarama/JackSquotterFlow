class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true

  validates :vote_status, :user_id, :votable_id, :votable_type, presence: true
  validates :user_id, uniqueness: {scope: [:votable_id, :votable_type]}
  validates :vote_status, numericality: { only_integer: true, greater_than_or_equal_to: -1, less_than_or_equal_to: 1 }


# def verify_vote
  # if self.find_by(user_id: current_user)
  # else
  # end
end
#
#   def self.update_or_create(attributes)
#     assign_or_new(attributes).save
#   end
#
#   def self.assign_or_new(attributes)
#     obj = first || new
#     obj.assign_attributes(attributes)
#     obj
#   end
#
# end
