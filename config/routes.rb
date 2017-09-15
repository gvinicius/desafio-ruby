Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products
  devise_for :stores
  root to: "application#index"

  authenticate :store do
    resources :products, only: [:new, :create, :edit, :update, :destroy, :delete]
  end

  get '/search', to: 'application#search'
end
