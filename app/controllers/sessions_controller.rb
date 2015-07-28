class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
  	user = User.find_by(email: params[:email])
  	if user && user.authenticate(params[:password])
  		flash[:success] = "Congratulations!  You are logged in #{user.name}." 
      session[:user_id] = user.id
  		redirect_to user_path(user)
  	else
  		flash[:failure] = "You have entered an incorrect user name/password combination.  Please try again."
  		redirect_to login_path
  	end
  end
  
  def destroy
  	session[:user_id] = nil
  	redirect_to home_path, notice: "You are logged out"
  end	

end






