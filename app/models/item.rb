class Item < ActiveRecord::Base

	before_create :format_url

	validates_presence_of :user_id, :name

	belongs_to :user

	def format_url		
		if url_link.start_with?("http://")
			url_link
		elsif url_link.empty?
			" "
		else	
			url_link.prepend("http://") 
		end
	end

end
