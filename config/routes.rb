Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #root 'users#index'
  get "users", to:"users#index", as: 'users'
  get "users/:id", to: "users#show", as: 'user'
  get "users/:user_id/posts", to: "posts#index"
  get "users/:user_id/posts/:post_id", to: "posts#show"

end
