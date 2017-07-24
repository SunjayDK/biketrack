Rails.application.routes.draw do

	get '/', to: 'authentication#index'
	get '/login', to: 'authentication#login'
	get '/logout', to: 'authentication#logout'
	get '/register', to: 'authentication#register'

end
