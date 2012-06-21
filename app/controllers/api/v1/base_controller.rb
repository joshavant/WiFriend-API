class Api::V1::BaseController < ApplicationController
  # Exception Catching
  rescue_from Koala::Facebook::APIError do |exception|
    if exception.fb_error_type == "OAuthException" then render_unauthorized_error
    elsif render_internal_server_error end
  end
  
  # Error Response Templates
  def render_bad_request_error
    render_error(400, "Bad Request")
  end

  def render_unauthorized_error
    render_error(401, "Unauthorized")
  end
  
  def render_method_not_allowed_error
    render_error(405, "Method Not Allowed")
  end
  
  def render_internal_server_error
    render_error(500, "Internal server error")
  end

  protected
  def render_error(http_status_code, message)
    @status_code = http_status_code
    @message = message
    render "/api/v1/error", :status => @http_status_code
  end
end