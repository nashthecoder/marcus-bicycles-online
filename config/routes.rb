Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  resources :products, only: [ :index, :show ]
  root "products#show"
end
