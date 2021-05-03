Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    authenticated :user do
      root "wishes#index", as: :authenticated_root
    end

    unauthenticated :user do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end

  get '/account', to: 'users#show', as: :user

  resources :wishes, only: [:index, :create, :new]
end
