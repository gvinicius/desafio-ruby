Rails.application.routes.draw do
  resources :products
  devise_for :stores
  root to: "application#index"

  authenticate :store do
    resources :products, only: [:new, :create, :edit, :update]
  end
end
