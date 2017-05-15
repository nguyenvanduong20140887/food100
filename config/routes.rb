Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    root "pages#show", page: "home"
    get "pages/*page" => "pages#show", as: :page
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/:locale", to: "pages#home"
    resources :users
  end
end
