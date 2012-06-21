class Api::V1::AuthTokensController < Api::V1::BaseController
  respond_to :json
  
  before_filter :render_method_not_allowed_error, :only => [:create, :delete]
  
  def create
    # do nothing
  end
  
  def show
    if params[:facebook_access_token].blank? then render_bad_request_error end

    graph_api = Koala::Facebook::API.new(params[:facebook_access_token])

    facebook_profile = graph_api.batch do |batch_api|
      batch_api.get_object("me", {fields: ["id", "first_name", "last_name"]})
      batch_api.get_picture("me", :type => "large")
      batch_api.get_object("me/friends")
    end

    user = User.find_by_facebook_user_id(facebook_profile[0]["id"])
    
    if user
      # refresh the user profile
      user.update_attributes(:first_name          => facebook_profile[0]["first_name"],
                             :last_name           => facebook_profile[0]["last_name"],
                             :profile_picture_url => facebook_profile[1])
    else
      # create a new user profile
      user = User.create(:first_name          => facebook_profile[0]["first_name"],
                         :last_name           => facebook_profile[0]["last_name"],
                         :facebook_user_id    => facebook_profile[0]["id"],
                         :profile_picture_url => facebook_profile[1])
    end
    
    # refresh friendships table with user's fb relationships
    user.friends.destroy_all # don't destroy all? it'll momentarily remove someone!

    facebook_profile[2].each do |friend|
      friend_user = User.find_by_facebook_id(friend["id"])
      if friend_user
        # create both forward and reverse relationships
        Friendship.create(:user_id => user.id, :friend_user_id => friend_user.id)
        Friendship.create(:user_id => friend_user.id, :friend_user_id => user.id)
      end
    end
        
    # subscribe to friends updates, picture changes, name changes
    updates = Koala::Facebook::RealtimeUpdates.new(:app_id => 'censored', :secret => 'censor')

    updates.subscribe("user", "friends", "http://censored:3000/subscriptions", "madebyjosh")
    
        
    # create auth_token in database

    # respond with JSON that contains auth_token

  end

  def update
    
  end
  
  def destroy
    # do nothing
  end
  
end