class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(app_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to root_url, notice: "Great Success!  You're signed up."
		else
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(app_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to accounts_path
	end

	private
		def app_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
