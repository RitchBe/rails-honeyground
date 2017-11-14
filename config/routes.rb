Rails.application.routes.draw do

  devise_for :users, :path => 'accounts', controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :users  do
    resources :products
    resources :sales , only: [:new, :create, :index, :show]
  end
end
