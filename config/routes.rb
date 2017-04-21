Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'registrations' }


  root to: 'services#home'
  root to: "home#index"

  resources :services, only: [ :home, :show, :index ]  do
    resources :proposals, only: [ :show, :create, :index, :new ]
  end

  resources :my_services

  resources :my_proposals, only: [ :show, :index, :edit, :update, :destroy ] do
    member do
        patch :finish
    end
  end

  resources :received_proposals, only: [ :show, :index ] do
    member do
      patch :accept
      patch :decline
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Attachinary::Engine => "/attachinary"
end
