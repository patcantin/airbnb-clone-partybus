Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/show'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: 'buses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :buses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: %i(show new create destroy)
    resources :reviews, only: %i(show new create destroy)
  end
  get '/pages/dashboard', to: 'pages#dashboard', as: 'dashboard'
  get '/search' => 'pages#search', :as => 'search_page'
end



