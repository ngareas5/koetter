Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api , defaults: {format: 'json'} do
    namespace :v1 do
    	resource :users, only: [] do
    	   put 'update/:id' => 'users#update'
         post 'forgot_password'
         post 'reset_password'
      end
        resources :products
        resources :order_histories
    end  	
  end
end
