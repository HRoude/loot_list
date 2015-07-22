class UsersController < ApplicationController

	def index
		@users = User.all 
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		redirect_to root_path
	end


	private

		def user_params
			params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
		end	

end
