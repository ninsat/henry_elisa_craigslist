class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
		else
			redirect_to new_session_path
		end
	end

	def destroy
		session.clear
		redirect_to 
	end
end
