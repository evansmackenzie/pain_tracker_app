Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  # namespace :api do
  #   get "/photos" => "photos#index"
  # end
  namespace :api do
    post "/users" => "users#create"
    post "/sessions" => "sessions#create"

    get "/users/:id" => "users#show"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts" => "posts#create"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    get "/variables" => "variables#index"
    get "/variables/:id" => "variables#show"
    post "/variables" => "variables#create"
    delete "variables/:id" => "variables#destroy"

    post "/entries" => "entries#create"
    patch "/entries/:id" => "entries#update"
    delete "/entries/:id" => "entries#destroy"
  end

end
