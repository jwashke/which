Rails.application.routes.draw do
  get "/", to: "home#show", as: :root
  get "/auth/twitch", as: :twitch_login
  get "/auth/twitch/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout
end
