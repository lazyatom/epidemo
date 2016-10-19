Rails.application.routes.draw do
  resources :records, only: [:new, :create, :edit, :update]

  get "/create", to: "records#new"
  get "/record/:secret/:source_id(/:scanned_by)", to: "records#new"

  get "/qr_code", to: "qr_codes#show"
  get "/data", to: "data#index"
  get "/simulation", to: "data#simulation"
  get "/stickers", to: "data#stickers", as: :sticker
end

