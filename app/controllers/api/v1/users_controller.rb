class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  
  def create
    
  end
  
  def show
    @user = User.find_by_id(params[:id])
    @user = User.all
  end
  
  def update
    
  end
  
  def delete
    
  end
end