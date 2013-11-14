class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(app_params)
		if @user.save
			redirect_to root_url, notice: "Great Success!  You're signed up."
		else
			render "new"
		end
	end

	private
		def app_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
