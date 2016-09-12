Rails.application.routes.draw do
	root 'categories#index'
	resources :session, only: [:new, :create, :destroy]
	resources :category, only: [:index, :show]
	resources :article
	resources :user, only: [:show, :new, :create]
end
