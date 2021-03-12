Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products

  get 'cart', to: 'order_items#index', as: 'cart'

  post 'cart/:product_id/add', to: 'order_items#create', as: 'add_product'

  delete 'cart/:item_id/remove', to: 'order_items#destroy', as: 'destroy_item'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
end
