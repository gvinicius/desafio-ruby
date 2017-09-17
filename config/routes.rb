Rails.application.routes.draw do
  devise_for :stores
  root to: "application#index"

  #get '/search', to: 'application#search'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  authenticate :store do
    resources :products, only: [:new, :create, :edit, :update, :destroy, :delete]
  end
end
