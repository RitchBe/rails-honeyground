Rails.application.routes.draw do
  get 'products/index'

  get 'products/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/destroy'

  get 'sales/index'

  get 'sales/show'

  get 'sales/new'

  get 'sales/create'

  get 'sales/edit'

  get 'sales/update'

  get 'sales/destroy'

  devise_for :users, :path => 'accounts'
  root to: 'pages#home'
  resources :users  do
    resources :products
    resources :sales , only: [:new, :create, :index, :show]
  end


  # resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
