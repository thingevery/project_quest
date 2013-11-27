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
		@user = User.new(user_params)

		respond_to do |format|	
			if @user.save
				#session[:user_id] = @user.id
				#redirect_to root_url, notice: "Great Success!  You're signed up."

				# Tell the UserMailer to send a welcome Email after save
				format.html { UserMailer.welcome_email(@user).deliver
							  redirect_to(@user, notice: 'Great Success!  You\'re signed up.')}
				format.json { render json: @user, status: :created, location: @user}
			else
				format.html { render action: 'new' }
				format.json { render json: @user.errors, status: :unprocessable_entry }
				#render "new"
			end
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
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
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end
end
