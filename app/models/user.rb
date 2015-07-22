class User < ActiveRecord::Base

	has_secure_password
	validates_presence_of :user_name, :email, :password_digest
	validates_uniqueness_of :user_name, :email

end
