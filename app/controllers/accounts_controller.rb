class AccountsController < ApplicationController
	#http_basic_authenticate_with name: "defect", password: "secret", only: :destroy
	
	before_filter :authorize, only: [:index, :new, :create, :edit, :update, :destroy]

	def index
		@accounts = Account.all
	end

	def show
		@account = Account.find(params[:id])
	end

	def new
		@account = Account.new
	end

	def create
		#render text: params[:account].inspect

		# @user = User.find(params[:user_id])
		# @account = @user.accounts.create(account_params)
		# redirect_to user_path(@user)	

		@account = Account.new(account_params)

		if @account.save
			redirect_to @account
		else
			render 'new'
		end
	end

	def edit
		@account = Account.find(params[:id])
	end

	def update
		@account = Account.find(params[:id])

		if @account.update(account_params)
			redirect_to @account
		else
			render 'edit'
		end
	end

	def destroy
		# @user = User.find(params[:user_id])
		# @account = @post.comments.find(params[:id])
		# @account.destroy

		# redirect_to user_path(@user)
		@account = Account.find(params[:id])
		@account.destroy
		redirect_to accounts_path
	end

	private
		def account_params
			params.require(:account).permit(:name, :description)
		end
end
