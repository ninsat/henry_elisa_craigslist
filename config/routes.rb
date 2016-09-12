Rails.application.routes.draw do
	root 'categories#index'

	get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
	resources :categories, only: [:index, :show]
	resources :articles
	resources :users, only: [:show, :new, :create]
end
