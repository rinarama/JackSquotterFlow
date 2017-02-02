class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphism: true
  
end
