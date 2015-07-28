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
				redirect_to user_path(@user)
			else
				flash[:failure] = "Registration not successful.   Please try again."
				redirect_to home_path
			end						## TODO: specific error message / params on email/username
	end									## TODO:  get flashes to fade or timeout

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		redirect_to user_path
	end

	def delete
	end

	private

		def user_params
			params.require(:user).permit(:email, :name, :password, :password_confirmation, :birthday, :current_interests, :special_event, :general_dislikes)
		end	

end
