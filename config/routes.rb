Rails.application.routes.draw do
  resources :trips, defaults: {format: :json} do
    resources :locations, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
