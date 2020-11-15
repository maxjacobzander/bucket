Rails.application.routes.draw do
  resources :goals
  resources :bucket_lists do
    resources :goals
  end
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :bucket_lists
  end

  root to: "bucket_lists#index"
end