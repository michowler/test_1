Rails.application.routes.draw do
  
  root to: 'pages#index'
  #get '/profile/:id', to: 'users#show'

  #for chat function
  resources :conversations, only: [:create]

  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end  

  #for contact us page
  resources "contacts", only: [:new, :create]
  get '/contacts' => 'contacts#new'

  #registration
  devise_for :users, :controllers => {:registrations => "registrations"}

  #user authentication and forgot password
  devise_scope :user do
  get '/reset_password' => "passwords#new", :as => :reset_password
  get '/new_password' => "passwords#edit", :as => :new_password
  post '/send_email' => 'passwords#create', :as => :create_password
  put '/change' =>  'passwords#update', :as => :update_password
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
