Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  resources :products
  root "products#index"
end
