Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    resources :bookings
  end
end
