Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :alpacas, only: [:index, :show]
  #Request /PATH/   to:'controller#action'
   get 'user/dashboard', to:'alpacas#dashboard'
end
