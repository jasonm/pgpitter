Pgpitter::Application.routes.draw do
  resources :statuses, only: [:create, :show]
  resources :followers, only: [] do
    resources :statuses, only: [:index]
  end
end
