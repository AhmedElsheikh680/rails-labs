Rails.application.routes.draw do
  get 'registration', to: 'auth#registration', as: :registration
  post 'auth/signup',  to: 'auth#signup', as: 'signup'
  get 'login', to: 'auth#signin_form', as: 'login'
  post 'auth/signin', to: 'auth#signin', as: 'signin'
  post 'logout', to: 'auth#logout', as: 'logout'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
