class UsersController < ApplicationController
	skip_before_action :require_login

	def index
		render :login
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(
			{
				fullname: params[:user][:fullname],
				email: params[:user][:email],
				password: params[:user][:password]
			}
		)
		# Checks if there's already a user with that email
		if User.find_by(email: @user.email)
			@errors = ["There already is a user with #{@user.email}"]
		else
			# Checks for matching passwords
			if params[:user][:password] == params[:user][:password_confirmation]
				# Checks for valid properties
				if @user.save
					redirect reports_new_path
				else
					@errors = @user.errors.full_messages
				end
			else
				@errors = ['Passwords do not match']
			end
		end
		render :new
	end

end
