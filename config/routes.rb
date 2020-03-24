Rails.application.routes.draw do
  resources :mining_types
  root to: 'welcome#index' #http 'name', to: 'controller#action'
  resources :coins
end
