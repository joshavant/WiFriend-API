class User < ActiveRecord::Base
  has_one :access_point
  has_one :auth_token
  has_many :friendships
  has_many :friends, :through => :friendships, :as => :user
end