Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/students" => "students#index"
    post "/students" => "students#create"
    get "/students/:id" => "students#show"
    patch "/students/:id" => "students#update"
    delete "/students/:id" => "students#destroy"

    post "/sessions" => "sessions#create"

    get "/experiences" => "experiences#index"
    get "/experiences/:id" => "experiences#show"
    post "experiences" => "experiences#create"
    patch "experiences" => "experiences#update"
    delete "experiences/:id" => "experiences#destroy"
  end
end
