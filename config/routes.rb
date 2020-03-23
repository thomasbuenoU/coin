Rails.application.routes.draw do
  root to: 'welcome#index' #http 'name', to: 'controller#action'
  resources :coins
end
