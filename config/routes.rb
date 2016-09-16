Rails.application.routes.draw do
  get "/create", to: "records#create"
  get "/qr_code", to: "qr_codes#show"
end

