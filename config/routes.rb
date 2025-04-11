Rails.application.routes.draw do
  # Resourceful routes
  resources :users
  resources :projects

  # Dashboards (separate for user and admin)
  get 'dashboard', to: 'dashboard#show', as: 'user_dashboard'
  get 'admin_dashboard', to: 'dashboard#admin', as: 'admin_dashboard'

  # Sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Admin management
  post "/users/:id/set_admin", to: "users#set_admin", as: "set_admin"
  post "/users/:id/remove_admin", to: "users#remove_admin", as: "remove_admin"

  # Root
  root "sessions#new"
end
