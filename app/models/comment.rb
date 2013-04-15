class Comment < ActiveRecord::Base
  belongs_to :user
   attr_accessible :your_comments

  validates :user_id, :presence => true
end
