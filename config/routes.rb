Rails.application.routes.draw do
	root 'reports#new'

	get '/login', to: 'users#index'
	post '/login', to: 'authentication#login'
	post '/logout', to: 'authentication#logout'

	resources :reports, only: [:new, :create]
	resources :users, only: [:new, :create, :index]

end
