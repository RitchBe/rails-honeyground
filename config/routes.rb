Rails.application.routes.draw do

  devise_for :users, :path => 'accounts', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  get '/index', to: 'pages#index'
  resources :users  do
      resources :sales , only: [:index, :show]
    resources :products do
      resources :sales , only: [:new, :create, :index, :show]
    end
  end

  mount Attachinary::Engine => "/attachinary"
end
