Rails.application.routes.draw do
  resources :articles
  resources :resources
  root 'articles#index'
end
