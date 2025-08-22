Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # US: As a user, I can see all my movie lists => index
  # US: As a user, I can create a movie list => new + create
  # US: As a user, I can see the details of a movie list => show
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end

  # US: As a user, I can destroy a bookmark > destroy
  resources :bookmarks, only: [:destroy]
  # delete "lists/:list_id/bookmarks/:id", to "bookmarks#destroy", as: :delete_bookmark
end
