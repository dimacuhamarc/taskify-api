Rails.application.routes.draw do
  devise_for :users, path: '', 
  path_names: { 
    sign_in: 'signin', 
    sign_out: 'signout', 
    sign_up: 'signup' 
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  },
  defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Define a resource route for a controller

  devise_scope :user do
    post 'signup', to: 'users/registrations#create'
  end

  

  scope :api do
    scope :v1 do
      resources :categories
      get 'tasks/uncategorized', to: 'tasks#uncategorized'
      resources :tasks
    end
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
