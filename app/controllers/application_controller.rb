class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :require_login
	helper ApplicationHelper
	include ApplicationHelper

	private

	def require_login
	  if session[:user_id].nil?
	    redirect_to root_path
	  end
	end
end
