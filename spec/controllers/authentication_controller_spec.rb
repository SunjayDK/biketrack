require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do

	let(:user_params) {
    email: "sleepyheadzzz@gmail.com",
    password: 'SnoozeAlarm12pm',
    fullname: "Rip van Winkle"
  }
  
  describe "#login" do

  	before do
  		User.create!(user_params)
  	end

    it "should successfully login a session" do
      expect(session[:user_id]).to be_nil
      post :login, params: user_params
      expect(session[:user_id]).to_not be_nil
    end

    it "redirects the student to the challenges url" do
      post :login, params: user_params
      expect(response).to redirect_to challenges_path
    end

  end

  describe "#logout" do
    before do
  		@request.session[:user_id] = User.create!(user_params).id
      post :login, params: user_params
    end

    it "should clear the session" do
      expect(session[:user_id]).to_not be_nil
      post :logout
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to the home page" do
      post :logout
      expect(response).to redirect_to root_url
    end
  end
end
