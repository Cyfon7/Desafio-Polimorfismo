Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  #authenticate :admin do
    resources :payments
    resources :images
    resources :products
  #end

  resource :cart, only: [:show, :update] do
    member do
      post :pay_with_paypal
      get  :process_paypal_payment
    end
  end

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
