Rails.application.routes.draw do
  devise_for :users
  root to: 'buses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :buses, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: %i(new create destroy)
  end
  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'
end



