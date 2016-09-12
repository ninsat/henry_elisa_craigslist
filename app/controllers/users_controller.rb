class UsersController < ApplicationController
	def new
	end

  def show
  	@user = User.find(params[:id])
  	@articles = @user.articles
  end

	def create
		user = User.new(user_params)
		if user.save
		  session[:user_id] = user.id 
		  redirect_to categories_path
		else
			render new_session_path
		end
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end
