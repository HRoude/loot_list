class Group < ActiveRecord::Base

	has_many 	:memberships, :dependent => :destroy
	has_many  :users, through: :memberships
	
	validates_presence_of 	:name
	validates_uniqueness_of :name

	def owner_name
		User.find(owner_id).name
	end

	def in_group?(user)
  	users.exists?(user.id)
	end
		
end
