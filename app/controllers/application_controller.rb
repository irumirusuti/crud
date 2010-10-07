# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AuthenticatedSystem

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password 
  private 
  def require_is_admin
   if current_user == nil || !current_user.is_admin  
    redirect_to root_url
   end
  end

end
