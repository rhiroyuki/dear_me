Rails.application.routes.draw do
  root 'landing_page#index'

  resources :emails, only: [:create]

  get 'confirm_email/:token', to: 'emails#confirm_email', as: 'email_confirmation'
end
