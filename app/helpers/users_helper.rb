module UsersHelper

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	redirect_to new_session_path unless logged_in?
  end
  
end
