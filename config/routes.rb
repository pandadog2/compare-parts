Rails.application.routes.draw do
  devise_for :users
  root 'parts#index'
  resources :car_models, only: [:index, :new, :create] do
    resources :parts
  end
end
