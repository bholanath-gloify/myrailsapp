Rails.application.routes.draw do

  resources :resumes, only: [:index, :new, :show, :create, :destroy]   


  resources :user do
    get 'index', :on => :collection
    post 'create', :on => :collection  
    post 'new', :on => :collection
    get 'show', :on => :member
    post 'edit', :on => :member
    delete 'destroy', :on => :collection
  end
  
  resources :book do
    get 'index', :on => :collection
    post 'new', :on => :collection
    post 'edit', :on => :member
  end
  resources :library do
    get 'index', :on => :collection
    post 'new', :on => :collection
    post 'edit', :on => :member
  end
  root "library#index"



  #for apis routes
  # devise_for :users do
  #   namespace :api do
  #     namespace :v1 do 
  #       resources :library, only: [:index, :show, :create, :update, :destroy]
  #       resources :books, only: [:index, :show, :create, :update, :destroy]
  #       resources :authors, only: [:index, :show, :create, :update, :destroy]
  #     end
  #   end
  # end

end
