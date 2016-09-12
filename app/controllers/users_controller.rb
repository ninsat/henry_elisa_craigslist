class UserController < ApplicationController
	def new
	end

  def show
  end

	def create
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end
