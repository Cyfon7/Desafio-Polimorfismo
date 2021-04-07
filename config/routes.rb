Rails.application.routes.draw do
  resources :payments
  resources :images
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
