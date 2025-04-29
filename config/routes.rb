Rails.application.routes.draw do
  get "home/index"

  resources :projects do
    resources :attachments, only: [:create, :destroy]
    resources :project_memberships, only: [:create]
    resources :project_threads, path: 'threads' do
      resources :messages, only: [:new, :create, :edit, :update, :destroy, :show]
    end
  end

  resources :users

  # Dashboard route (renders the same view based on user role)
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get "/search", to: "search#index", as: :search

  # Sessions
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Admin management
  post "/users/:id/set_admin", to: "users#set_admin", as: "set_admin"
  post "/users/:id/remove_admin", to: "users#remove_admin", as: "remove_admin"

  # Root route
  root "home#index"
end
