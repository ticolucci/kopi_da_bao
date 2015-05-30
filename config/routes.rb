Rails.application.routes.draw do
  resources :orders, except: :delete
  resources :features, except: :show
  resources :drinks
end
