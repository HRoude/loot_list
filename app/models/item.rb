class Item < ActiveRecord::Base

	validates_presence_of :user_id, :item_name

	belongs_to :user
end
