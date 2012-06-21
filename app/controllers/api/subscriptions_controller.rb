class Api::SubscriptionsController < ActionController::Base
  def show
    render :text => Koala::Facebook::RealtimeUpdates.meet_challenge(params, 'madebyjosh').to_s
  end
  
  def create
    puts "Got something from Facebook!"
    puts params
    render :status => 200
  end
end