Rails.application.routes.draw do
  root "library#index"

  get 'books#index'
  
  devise_for :users do
    namespace :api do
      namespace :v1 do 
        resources :library, only: [:index, :show, :create, :update, :destroy]
        resources :books, only: [:index, :show, :create, :update, :destroy]
        resources :authors, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
