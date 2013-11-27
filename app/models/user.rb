class User < ActiveRecord::Base

	#attr_accessible :username, :email, :password, :password_confirmation
	# `attr_accessible` is extracted out of Rails into a gem. 
	# Please use new recommended protection model for params(strong_parameters) 
	# or add `protected_attributes` to your Gemfile to use old one.

	validates_presence_of :username, :email
	#validates_presence_of :password, :on => :create
	validates_uniqueness_of :email

	has_secure_password

	before_create {generate_token(:auth_token)}

	def generate_token(column)
		begin
			self[column] = SecureRandom.urlsafe_base64
		end while User.exists?(column => self[column])
	end

	def send_password_reset
		generate_token(:password_reset_token)
		self.password_reset_sent_at = Time.zone.now
		save!
		UserMailer.password_reset(self).deliver
	end
end
