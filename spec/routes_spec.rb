require 'rails_helper'

RSpec.describe "Routing for logging in and out", :type => :routing do

  it "routes POST /login to authentication#login" do
    expect(:post => "/login").to route_to("authentication#login")
  end

  it "routes GET /logout to authentication#logout" do
    expect(:get => "/logout").to route_to("authentication#logout")
  end

  it "routes GET / to authentication#index" do
    expect(:get => "/").to route_to("authentication#index")
  end
end

RSpec.describe "Routing for registering a new member", :type => :routing do

  it "routes GET /users/new to user#new" do
    expect(:get => "/users/new").to route_to("user#new")
  end
  
  it "routes POST /users to user#create" do
    expect(:get => "/users").to route_to("user#create")
  end

end

RSpec.describe "Routing for making a new report", :type => :routing do

  it "routes GET /reports/new to report#new" do
    expect(:get => "/reports/new").to route_to("report#new")
  end
  
  it "routes POST /reports to report#create" do
    expect(:get => "/reports").to route_to("report#create")
  end

end