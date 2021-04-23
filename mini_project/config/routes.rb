Rails.application.routes.draw do
  resources :animals


  resources :dogs, path: :animals
  resources :cats, path: :animals
  resources :cows, path: :animals

  root "animals#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
