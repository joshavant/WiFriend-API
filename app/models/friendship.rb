class Friendship < ActiveRecord::Base
  set_primary_key :user_id

  attr_accessible :user_id, :friend_user_id
  
  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_user_id'
  
end
