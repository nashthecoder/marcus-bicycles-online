Rails.application.routes.draw do
  devise_for :users
  mount Avo::Engine, at: Avo.configuration.root_path
  resources :products, only: [ :index, :show ]
  resources :carts, only: [:index, :show] do
    post 'add_product', on: :member
  end
  resources :orders, only: [ :index ]
  get "checkout", to: "cart#checkout", as: :checkout
  root "products#show"
end
