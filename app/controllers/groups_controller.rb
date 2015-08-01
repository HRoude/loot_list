class GroupsController < ApplicationController

	def index
		@groups = Group.where(owner_id: current_user.id)
	end

	def new
		@group = Group.new
	end

	def create
		@group = current_user.groups.create(group_params.merge(owner_id: current_user.id))
		redirect_to groups_url				
	end

	def show
		@group = Group.find(params[:id])
		if current_user.id != @group.owner_id
		  flash[:notice] = 'You have not created any groups yet'	
		  redirect_to user_url(@user)
		end
	end

	def create_invite  
		@group = Group.find(params[:group_id])
		@user = User.new
	end

	def send_invite
		@group = Group.find(params[:group_id])

		if User.exists?(email: params[:user][:email])
  		@user = User.find_by(email: params[:user][:email])
  		
  		#UserMailer.welcome_email(@user).deliver_now  EMAIL WELCOME TO GROUP
  	else 	
			@user = User.create(user_params.merge(password: 'password', password_confirmation: 'password'))
    
    	

   #  	if @user.persisted?
			# UserMailer.welcome_email(@user).deliver_now   # EMAIL WELCOME TO GROUP
			# end																							# AND PASSWORD UPDATE
		end
		@user.groups << @group
		redirect_to groups_url
	end	
	
	def edit
		@group = Group.find(params[:id])
		if current_user.id != @group.owner_id
      redirect_to groups_url(@group)		
    end
	end		

	def update
		@group = Group.find(params[:id])
		if current_user.id == @group.owner_id
			@group.update(group_params)
			flash[:success] = 'You have successfully edited the Group!'
		end	
		redirect_to groups_url(@group)
	end   			

	def destroy
		@group = Group.find(params[:id])
		if current_user.id == @group.owner_id
			@group.destroy
			flash[:success] = 'You successfully deleted this Group!'
		end		
		redirect_to groups_url
	end


	private

		def group_params
			params.require(:group).permit(:name)
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end
	
end     # end Class




