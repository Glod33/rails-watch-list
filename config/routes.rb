Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # ///////////////////////////////////////////////////////////////////////////////////////////////////

  # list routes
  # A user can see all the lists
  # A user can see a specific list
  # A user can create a new list
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: %i[new create]
  end

  # Bookmark routes
  # A user can add a new bookmark (movie/list pair) to an existing list
  # A user can delete a bookmark from a list. How can we make a delete link again?
end
