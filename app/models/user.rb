class User < ActiveRecord::Base
	# has_many :accounts
	validates :name, presence: true,
					 length: {minimum: 2}
end
