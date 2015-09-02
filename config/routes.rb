Rails.application.routes.draw do
  get 'static_pages/welcome'

  get 'static_pages/root'

  get 'users/new'

  get 'sessions/new'

  root to: "static_pages#root"
  get "/welcome", to: "static_pages#welcome"

  resources :users
  resource :session

  namespace :api, defaults: { format: :json } do
    resources :ideas
  end
end
