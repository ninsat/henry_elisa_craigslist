class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # helper_method :current_user, :logged_in?, :require_user
	
	include UsersHelper

end
