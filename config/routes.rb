Rails.application.routes.draw do
  # resources :movies
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: :create
  end

  # resources :bookmarks
  # resources :movies do
  #   resources :bookmarks, only: [:create, :destroy]
  # end
end
