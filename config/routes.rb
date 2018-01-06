Rails.application.routes.draw do
  root 'landing_page#index'

  resources :emails, only: [:create]
end
