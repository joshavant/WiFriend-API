class AuthToken < ActiveRecord::Base
  set_primary_key :auth_token
  belongs_to :user
end
