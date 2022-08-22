Rails.application.routes.draw do
  root "home#index"
  resources :trains
  resources :cars
  resources :routes
  resources :stations
end
