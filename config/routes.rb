Stockstarter::Application.routes.draw do
  
  match "about" => "pages#about", as: 'about'
  match "contact" => "pages#contact", as: 'contact'
  match "how-it-works" => "pages#how", as: 'how'
  match "legal" => "pages#legal", as: 'legal'
  
  #match 'login' => 'user_sessions#new', as: 'login'
  #match 'logout' => 'user_sessions#destroy', as: 'logout'

  resources :companies do
    resources :funding_rounds
  end
  resources :company_users
  resources :orders
  resources :users do
    member do
      get :activate
    end
  end
  
  resources :password_resets, only: [:create, :edit, :update]

  root :to => 'pages#home'

end
