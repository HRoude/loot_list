class GroupsController < ApplicationController

	def index
		@group = Group.new
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.create(group_params)
		redirect_to group_url(@group)
	end

	def show
		@group = Group.find(params[:id])
	end
		
	def edit
		@group = Group.find(params[:id])
	end			# TODO  set up restrictions of whom can edit group

	def update
		@group = Group.find(params[:id])
		@group.update(group_params)
		redirect_to group_url(@group)
	end   			# TODO  set up restrictions of whom can update group

	def destroy
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to user_path

	end


	private

		def group_params
			params.require(:group).permit(:name)
		end
	

end     # end Class
