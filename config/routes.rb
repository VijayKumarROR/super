Rails.application.routes.draw do
  resources :stores
  get 'admin/login'
  post 'admin/login'
  get 'admin/logout'

	#resources :account

	get 'account/signup'
	post 'account/signup'
	get 'account/login'
	post 'account/login'
	get 'account/welcome'
	get 'account/logout'
	get 'account/reset_password'
	post 'account/reset_password'
	get 'account/forget_password'
	post 'account/forget_password'

	get '/account', to: 'account#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
