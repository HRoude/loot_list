class Group < ActiveRecord::Base

	has_many 	:group_memberships, :dependent => :destroy
	has_many  :users, through: :group_memberships
	
	validates_presence_of 	:name
	validates_uniqueness_of :name

end
