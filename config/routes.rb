Rails.application.routes.draw do
  get '/profile/:id', to: 'users#show'
  resources :conversations, only: [:create]

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end
  
  root to: 'pages#index'

  resources "contacts", only: [:new, :create]
  get '/contacts' => 'contacts#new'

  devise_for :users, :controllers => {:registrations => "registrations"}

  devise_scope :user do
  get '/reset_password' => "passwords#new", :as => :reset_password
  get '/new_password' => "passwords#edit", :as => :new_password
  post '/send_email' => 'passwords#create', :as => :create_password
  put '/change' =>  'passwords#update', :as => :update_password
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
