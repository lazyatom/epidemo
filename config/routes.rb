Rails.application.routes.draw do
  resources :records, only: [:new, :create, :edit, :update]

  get "/create", to: "records#new"

  get "/qr_code", to: "qr_codes#show"
  get "/data", to: "data#index"
  get "/simulation", to: "data#simulation"
end

