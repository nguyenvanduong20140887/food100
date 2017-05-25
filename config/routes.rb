Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "pages#show", page: "home"
    get "pages/*page" => "pages#show", as: :page
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/:locale", to: "pages#home"
    resources :users
    resources :foods
  end
end
