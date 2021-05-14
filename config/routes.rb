Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, skip: [:sessions, :registrations, :passwords, :confirmations], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  as :user do
    # sessions routes
    get 'signin',             to: 'devise/sessions#new',              as: :new_user_session
    post 'signin',            to: 'devise/sessions#create',           as: :user_session
    delete 'signout',         to: 'devise/sessions#destroy',          as: :destroy_user_session

    # registrations routes
    get 'signup',             to: 'devise/registrations#new',         as: :new_user_registration
    get 'profile',            to: 'devise/registrations#edit',        as: :edit_user_registration
    get 'cancel-signup',      to: 'devise/registrations#cancel',      as: :cancel_user_registration
    post 'profile',           to: 'devise/registrations#create',      as: :user_registration
    patch 'profile',          to: 'devise/registrations#update',      as: ''
    put 'profile',            to: 'devise/registrations#update',      as: ''
    delete 'profile',         to: 'devise/registrations#destroy',     as: ''

    # passwords routes
    get 'forgot-password',    to: 'devise/passwords#new',             as: :new_user_password
    get 'reset-password',     to: 'devise/passwords#edit',            as: :edit_user_password
    patch 'password',         to: 'devise/passwords#update',          as: :user_password
    put 'password',           to: 'devise/passwords#update',          as: ''
    post 'password',          to: 'devise/passwords#create',          as: ''

    # account confirmations routes
    get 'confirm-account',    to: 'devise/confirmations#new',         as: :new_user_confirmation
    get 'confirmation',       to: 'devise/confirmations#show',        as: :user_confirmation
    post 'confirmation',      to: 'devise/confirmations#create',      as: ''
  end

  devise_scope :user do
    # root path if user is already signed in
    authenticated :user do
      root "wishes#index", as: :authenticated_root
    end

    # root path if user is not signed in
    unauthenticated :user do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # users path
  get '/account', to: 'users#show', as: :user

  # wishes path
  resources :wishes, only: [:index, :create, :new]
end
