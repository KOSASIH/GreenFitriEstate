# Routing configuration file

Rails.application.routes.draw do
  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :properties, only: [:index, :show, :create, :update, :destroy]
      resources :bookings, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # Web routes
  root "welcome#index"

  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  post "/users", to: "users#create"
  patch "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"

  get "/properties", to: "properties#index"
  get "/properties/:id", to: "properties#show"
  post "/properties", to: "properties#create"
  patch "/properties/:id", to: "properties#update"
  delete "/properties/:id", to: "properties#destroy"

  get "/bookings", to: "bookings#index"
  get "/bookings/:id", to: "bookings#show"
  post "/bookings", to: "bookings#create"
  patch "/bookings/:id", to: "bookings#update"
  delete "/bookings/:id", to: "bookings#destroy"
end
