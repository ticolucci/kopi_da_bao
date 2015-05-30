Rails.application.routes.draw do
  resources :features, except: :show
  resources :drinks
end
