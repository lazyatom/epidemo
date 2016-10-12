Rails.application.routes.draw do
  get "/create", to: "records#create"
  patch "/update/:id", to: "records#update", as: "record"
  get "/qr_code", to: "qr_codes#show"
  get "/data", to: "data#index"
  get "/simulation", to: "data#simulation"
end

