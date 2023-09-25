Rails.application.routes.draw do
  get '/api/throw', to: 'game#throw'
  resources :tools do
    post 'set_beaten_tool', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "game#home"
end
