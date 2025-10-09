Rails.application.routes.draw do
  resources :projects do
    resources :entries
  end

  resources :auth, only: [ :create ]
end
