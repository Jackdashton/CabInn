Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/home", to: "pages#home"

  get "/flats", to: "flats#index"
  get "/flats/new", to: "flats#new"
  get "/flats/:id", to: "flats#show"
  post "flats", to: "flats#create"

end
