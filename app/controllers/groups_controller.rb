class GroupsController < ApplicationController

	def index
		@group = Group.new
		@groups = Group.all
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params.merge(owner_id: current_user.id))
		redirect_to groups_url				
	end

	def show
		@group = Group.find(params[:id])
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
	

end     # end Class




