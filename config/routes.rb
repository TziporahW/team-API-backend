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


    get "/skills" => "skills#index"
    get "/skills/:id" => "skills#show"
    post "/skills" => "skills#create"
    patch "/skills/:id" => "skills#update"
    delete "/skills/:id" => "skills#destroy"

    get "/capstones" => "capstones#index"
    get "/capstones/:id" => "capstones#show"
    post "/capstones" => "capstones#create"
    patch "/capstones/:id" => "capstones#update"
    delete "/capstones/:id" => "capstones#destroy"

    get "/experiences" => "experiences#index"
    post "/experiences" => "experiences#create"
    get "/experiences/:id" => "experiences#show"
    patch "/experiences" => "experiences#update"
    delete "/experiences/:id" => "experiences#destroy"

    get "/educations" => "educations#index"
    post "/educations" => "educations#create"
    get "/educations/:id" => "educations#show"
    patch "/educations" => "educations#update"
    delete "/educations/:id" => "educations#destroy"
  end
end
