Rails.application.routes.draw do
  resources :products, only: [:index, :update, :destroy]
  root 'products#index'
end
