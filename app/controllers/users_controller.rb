class UsersController < ApplicationController
	
	skip_before_action :authorize, only: [:new, :create]

	def index
		@users = User.all 
		@user = User.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
			if @user.persisted?
				flash[:success] = "Congratulations!  You have registered.  Please log in."
			else
				flash[:failure] = "Registration not successful.   Please try again."
			end
		redirect_to home_path
	end

	def show
		@user = User.find(params[:id])
	end



	private

		def user_params
			params.require(:user).permit(:email, :user_name, :password, :password_confirmation)
		end	

end
