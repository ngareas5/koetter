Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api , defaults: {format: 'json'} do
    namespace :v1 do
    	resource :users, only: [] do
    	   put 'update/:id' => 'users#update'
         post 'forgot_password'
         post 'reset_password'
         post 'add_address_details'
         get  'user_details'
      end
        resources :products
        resources :orders
    end  	
  end
end
