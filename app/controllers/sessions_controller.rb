class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(username: params[:username])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to root_path
		else
			@errors = user.errors.full_messages
			redirect_to login_path
		end
	end

	def destroy
		# session[:user_id] = nil
		session[:user_id] = nil
		redirect_to root_path
	end
end
