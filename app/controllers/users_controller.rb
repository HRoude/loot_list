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
			UserMailer.welcome_email(@user).deliver_now
			flash[:success] = "Congratulations!  You have registered.  Please log in."
			redirect_to user_path(@user)
		else
			flash[:failure] = "Registration not successful.   Please try again."
			redirect_to home_path
		end						## TODO: specific error message / params on email/username
	end								

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id != @user.id
			flash[:notice] = 'Not authorized to edit this profile'
      redirect_to user_path
    end 
	end

	def update
		@user = User.find(params[:id])
		if current_user.id != @user.id
			flash[:notice] = 'Not authorized to edit this profile'
    else 
			@user.update(user_params)
		end
		redirect_to user_path
	end


	private

		def user_params
			params.require(:user).permit(:email, :name, :password, :password_confirmation, :birthday, :current_interests, :special_event, :general_dislikes)
		end	

end
