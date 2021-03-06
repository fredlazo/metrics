Rails.application.routes.draw do

  devise_for :users

  resources :apps

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  root 'welcome#index'
end
