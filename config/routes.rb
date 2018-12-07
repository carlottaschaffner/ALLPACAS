Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :alpacas, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
    # resources :reviews, only: [:index, :new, :create, :show]
  end
  get 'user/dashboard', to:'alpacas#dashboard'
  resources :reviews, only: [:index, :create]

end

