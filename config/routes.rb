Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  resources :emails, only: [:new, :create]
  get 'emails/confirmation', to: 'emails#confirmation', as: 'emails_confirmation'
  root "emails#new"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

 
end
