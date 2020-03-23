Rails.application.routes.draw do
  root to: 'welcome#index' #controller#action
  resources :coins
end
