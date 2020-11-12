Rails.application.routes.draw do
  resources :channels
  resources :users do
    member { get :login }
  end
  resources :messages
  root to: 'channels#index'
end

