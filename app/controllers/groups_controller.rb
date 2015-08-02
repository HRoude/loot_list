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
		@group = find_group
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
	  		if @group.in_group?(@user)
					flash[:failure] = "This User is already in this group!"
				else	
	  			UserMailer.exist_user_group_welcome(@user, @group).deliver_now
	  			@user.groups << @group   	   # email welcome to group existing user
	  		end
	 		else 	 
			@user = User.create(user_params.merge(password: 'password', password_confirmation: 'password', password_reset_sent_at: Time.now))  # creates user / assigns column values	
	    	if @user.persisted?   
	  			@user.send_password_reset        
					UserMailer.new_user_group_welcome(@user, @group).deliver_now 
					@user.groups << @group 
				end								# email welcome to new user and password reset link				
			end	
		redirect_to groups_url
	end	
	
	def edit
		@group = find_group
		if current_user.id != @group.owner_id
      redirect_to groups_url(@group)		
    end
	end		

	def update
		@group = find_group
		if current_user.id == @group.owner_id
			@group.update(group_params)
			flash[:success] = 'You have successfully edited the Group!'
		end	
		redirect_to group_url
	end   			

	def destroy
		@group = find_group
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

		def find_group
			Group.find(params[:id])
		end	
	
end     # end Class




