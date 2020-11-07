Rails.application.routes.draw do
  resources :goals
  resources :bucket_lists
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "bucket_list#index"
end