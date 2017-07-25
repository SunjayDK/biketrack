class UsersController < ApplicationController
	skip_before_action :require_login

	def index
		render :login
	end

	def new
	end

	def create
	end

end
