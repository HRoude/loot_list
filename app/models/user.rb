class User < ActiveRecord::Base

	has_secure_password
	before_create { generate_token(:password_reset_token) }
	
	validates_presence_of 	:name, :email, :password_digest
	validates_uniqueness_of :name, :email
	
	has_many :items
	has_many :group_memberships
	has_many :groups, through: => :group_memberships

	def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

	def send_password_reset
	  generate_token(:password_reset_token)
	  self.password_reset_sent_at = Time.zone.now
	  save!
	  UserMailer.reset_register(self).deliver
	end

end








