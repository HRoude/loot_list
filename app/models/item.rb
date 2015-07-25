class Item < ActiveRecord::Base

	validates_presence_of :user_id, :item_name, :descrip
	validates_uniqueness_of :user_id

	belongs_to :user
end
