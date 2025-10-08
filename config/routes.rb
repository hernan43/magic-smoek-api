Rails.application.routes.draw do
  resources :projects

  resources :auth, only: [ :create ]
end
