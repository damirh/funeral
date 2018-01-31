Rails.application.routes.draw do
  devise_for :users

	resources :funerals
	
	root 'funerals#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
