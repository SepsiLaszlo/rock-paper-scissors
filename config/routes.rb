Rails.application.routes.draw do
  get 'game/home'
  get 'game/throw'
  resources :tools
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "game#home"
end
