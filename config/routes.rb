Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'users#index'
  get "users", to:"users#index", as: 'users'
  get "users/:id", to: "users#show", as: 'user'
  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:post_id", to: "posts#show"
  # Send post and likes
  get "/users/:user_id/posts/new", to: "posts#new"
  post "/users/:user_id/posts", to: "posts#create"
  post "/users/:user_id/posts/:id/comments", to: "comments#create"
  post "/users/:user_id/posts/:id/likes", to: 'likes#create'

end
