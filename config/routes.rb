Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "lists#index"

  get "/lists", to: "lists#index", as: :lists
  get "/lists/new", to: "lists#new", as: :new_list
  post "/lists", to: "lists#create"
  get "/lists/:id", to: "lists#show", as: :list
  get "/lists/:id/edit", to: "lists#edit", as: :edit_list
  patch "/lists/:id", to: "lists#update"
  put "/lists/:id", to: "lists#update"
  delete "/lists/:id", to: "lists#destroy"


  get "/lists/:list_id/bookmarks/new", to: "bookmarks#new", as: :new_list_bookmark

  post "/lists/:list_id/bookmarks", to: "bookmarks#create", as: :list_bookmarks

  get "/lists/:list_id/bookmarks/:id/edit", to: "bookmarks#edit", as: :edit_list_bookmark

  patch "/lists/:list_id/bookmarks/:id", to: "bookmarks#update"
  put "/lists/:list_id/bookmarks/:id", to: "bookmarks#update"

  delete "/lists/:list_id/bookmarks/:id", to: "bookmarks#destroy", as: :list_bookmark
end
