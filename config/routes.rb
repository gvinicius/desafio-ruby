Rails.application.routes.draw do
  devise_for :stores
  root to: "application#index"

  authenticate :store do
    resources :products, only: [:new, :create, :edit, :update, :destroy, :delete]
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
end
