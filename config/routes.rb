Rails.application.routes.draw do
  root "projects#index"

  resources :users
  resources :projects

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/users/:id/set_admin", to: "users#set_admin", as: "set_admin"
  post "/users/:id/remove_admin", to: "users#remove_admin", as: "remove_admin"
end
