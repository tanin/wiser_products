Rails.application.routes.draw do
  resources :products, only: [:index, :update]
  root 'products#index'
end
