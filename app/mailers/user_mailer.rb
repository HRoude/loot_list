class UserMailer < ApplicationMailer

	default from: "your.loot.list@gmail.com"

	def welcome_email(user)
		@user = user
		@url = 'loot-list.herokuapp.com/login'
		mail(	to: 				@user.email, 
					from:     	'http://your.loot.list@gmail.com', 
					subject: 		'Thank you for signing up with Loot-List',
					sent_on:    Time.now )
	end	

	def confirm_profile_update_email(user)
		@user = user
		@url = 'loot-list.herokuapp.com/users/:id/'
		mail(	to: 				@user.email, 
					from:     	'http://your.loot.list@gmail.com', 
					subject: 		'Confirming Loot-List Profile changes',
					sent_on:    Time.now )
	end	

	def new_password(user)   # new_password.html.erb in user_mailer
    @user = user
    @url = 'loot-list.herokuapp.com/users/:id/'
		mail(	to: 						@user.email, 
					from:     			'http://your.loot.list@gmail.com', 
					subject: 				'Password Reset',
					sent_on:    		Time.now,
					template_name:  'new_password' )
  end

  def exist_user_group_welcome(user, group)
  	@group_owner_name = User.find(group.owner_id).name
  	@group = group
  	@user = user
    @url = 'loot-list.herokuapp.com/users/:id/'
		mail(	to: 						@user.email, 
					from:     			'http://your.loot.list@gmail.com', 
					subject: 				'Welcome to Group!',
					sent_on:    		Time.now,
					template_name:  'exist_user_group_welcome' )
  end

  def new_user_group_welcome(user, group)
  	@group_owner_name = User.find(group.owner_id).name
  	@user = user
  	@group = group
    @url = 'loot-list.herokuapp.com/users/:id/'
		mail(	to: 						@user.email, 
					from:     			'http://your.loot.list@gmail.com', 
					subject: 				'Welcome to a Loot-List Group!',
					sent_on:    		Time.now,
					template_name:  'new_user_group_welcome' )
  	
  end

end   # end Class





