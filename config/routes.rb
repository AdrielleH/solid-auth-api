Rails.application.routes.draw do
  resources :user, only: [:create, :new]

  post '/auth/login', to: 'authentication#login'
  post 'user/create', to: 'user#create'
end
