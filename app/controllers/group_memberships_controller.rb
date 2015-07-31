class GroupMembershipsController < ApplicationController
  def index
    @group_membership = GroupMembership.new
    @group_memberships = GroupMembership.all
  end

  def new
    @group_membership = GroupMembership.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def group_membership_params
      params.require(:group_membership).permit(:group_id, :user_id)
    end

end     ## end Class





