Rails.application.routes.draw do
  devise_for :users
  resources :car_models, only: [:index, :new, :create]
end
