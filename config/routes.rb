Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/', as: 'rails_admin'
  resources :products
  devise_for :stores
  root to: "application#index"

  authenticate :store do
    resources :products, only: [:new, :create, :edit, :update, :destroy, :delete]
  end
end
