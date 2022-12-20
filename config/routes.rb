Rails.application.routes.draw do
  devise_for :users
  root to: "trees#index"
  get "/instructions", to: "pages#instructions", as: "instructions"

  resources :trees do
    resources :adoptions, only: %i[new create index destroy]
  end
end
