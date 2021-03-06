Rails.application.routes.draw do

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:create]
  
  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show], defaults: {format: :json}
      resources :categories, only: [:index, :show], defaults: {format: :json}
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :admin do
      resources :items, only: [:index, :show, :create, :update, :destroy], defaults: {format: :json}
      resources :categories, only: [:index, :show, :create, :update, :destroy], defaults: {format: :json}
      end
    end
  end

end
