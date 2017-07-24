require 'rails_helper'

RSpec.describe "Routing for logging in and out", :type => :routing do

  it "routes POST /login to authentication#login" do
    expect(:post => "/login").to route_to("authentication#login")
  end

  it "routes POST /logout to authentication#logout" do
    expect(:post => "/logout").to route_to("authentication#logout")
  end

end

RSpec.describe "Routing for registering a new member", :type => :routing do

  it "routes GET /users/new to users#new" do
    expect(:get => "/users/new").to route_to("users#new")
  end
  
  it "routes POST /users to users#create" do
    expect(:post => "/users").to route_to("users#create")
  end

end

RSpec.describe "Routing for making a new report", :type => :routing do

  it "routes GET /reports/new to reports#new" do
    expect(:get => "/reports/new").to route_to("reports#new")
  end
  
  it "routes POST /reports to reports#create" do
    expect(:post => "/reports").to route_to("reports#create")
  end

end