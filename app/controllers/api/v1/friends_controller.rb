class Api::V1::FriendsController < Api::V1::BaseController
  respond_to :json
  
  before_filter :render_method_not_allowed_error, :only => [:create, :update, :delete]
  
  def create
    # do nothing
  end
  
  def show
    
  end

  def update
    # do nothing
  end
  
  def destroy
    # do nothing
  end
  
end
