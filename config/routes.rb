Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  #authenticate :admin do
    resources :payments

    resources :products
    resources :images
    

    resources :digitals, path: :products
    resources :physicals, path: :products
    

  #end

  resource :cart, only: [:show, :update] do
    member do
      post :pay
      get  :process_paypal_payment
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
