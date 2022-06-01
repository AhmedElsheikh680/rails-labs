Rails.application.routes.draw do
  resources :posts, except: [:index , :destroy ]
  
  post 'register' ,to: 'auth#register' , as:'register'
  post 'login' , to:'auth#login',as: 'login'
  get 'signup' , to: 'auth#signup_form' ,as: 'signup'
  get 'signin' , to: 'auth#signin_form' ,as: 'signin'
  post 'logout' , to:'auth#logout',as: 'logout'
  delete 'posts/:id' , to: 'posts#destroy' , as:'destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"
end
