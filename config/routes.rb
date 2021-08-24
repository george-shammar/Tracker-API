Rails.application.routes.draw do
  resources :tracks do
    resources :days
  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
