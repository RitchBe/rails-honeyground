Rails.application.routes.draw do

  devise_for :users, :path => 'accounts'
  root to: 'pages#home'
  resources :users  do
    resources :products
    resources :sales , only: [:new, :create, :index, :show]
  end


  # resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
