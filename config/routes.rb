Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  get "/bookings", to: "pages#bookings"
  get "/account", to: "pages#account"
  get "/my_flats", to: "pages#my_flats"

  resources :flats do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end

  resources :reviews, only: [:destroy]

#   get "/flats", to: "flats#index"
#   get "/flats/new", to: "flats#new"
#   post "/flats", to: "flats#create"
#   get "/flats/:id", to: "flats#show", as: :flat
#   get "/flats/:id/edit", to: "flats#edit"
#   patch "/flats/:id", to: "flats#update"
#   delete "/flats/:id", to: "flats#destroy"
end
