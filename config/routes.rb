Rails.application.routes.draw do

  resources :items, only [:index, :show], defaults: {format: :json}

end
