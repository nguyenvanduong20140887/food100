Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "pages#show", page: "home"
    get "pages/*page" => "pages#show"
  end
end
