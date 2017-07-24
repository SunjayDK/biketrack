Rails.application.routes.draw do
	root 'reports#new'

	post '/login', to: 'authentication#login'
	post '/logout', to: 'authentication#logout'

	resources :users, :reports, only: [:new, :create]

end
