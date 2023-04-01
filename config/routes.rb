Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about"
  get "/home", to: "pages#home"

  get "/flats", to: "flats#index"
  get "/flats/new", to: "flats#new"
  post "/flats", to: "flats#create"
  get "/flats/:id", to: "flats#show", as: :flat
  get "/flats/:id/edit", to: "flats#edit"
  patch "/flats/:id", to: "flats#update"
  delete "/flats/:id", to: "flats#destroy"
end
