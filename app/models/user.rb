class User < ActiveRecord::Base
	has_secure_password

	#attr_accessible :username, :email, :password, :password_confirmation
	# `attr_accessible` is extracted out of Rails into a gem. 
	# Please use new recommended protection model for params(strong_parameters) 
	# or add `protected_attributes` to your Gemfile to use old one.

	validates_presence_of :username

	validates_uniqueness_of :email
end
