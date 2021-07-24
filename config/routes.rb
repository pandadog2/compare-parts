Rails.application.routes.draw do
  devise_for :users
  get 'parts/search'
  root 'parts#index'
  resources :car_models, only: [:index, :new, :create] do
    resources :parts
  end
end
