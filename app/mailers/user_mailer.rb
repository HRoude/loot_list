class UserMailer < ApplicationMailer

	default from: "want.it.list@gmail.com"

	def welcome_email(user)
		@user = user
		@url = 'want-it.herokuapp.com/login'
		mail(	to: @user.email, 
					from:     	'http://want.it.list@gmail.com', 
					subject: 		'Thank you for signing up with Want-It',
					sent_on:    Time.now )
	end	

	def confirm_profile_update_email(user)
		@user = user
		@url = 'want-it.herokuapp.com/users/:id/'
		mail(	to: @user.email, 
					from:     	'http://want.it.list@gmail.com', 
					subject: 		'Confirming Want-It Profile changes',
					sent_on:    Time.now )
	end	

end
