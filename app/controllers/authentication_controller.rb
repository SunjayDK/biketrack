class AuthenticationController < ApplicationController

  skip_before_action :require_login, only: [:login]

  def login
    user = User.find_by(email: params[:email])
    session[:user_id] = user.id
    redirect_to reports_path, :notice => "Signed in!"
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
