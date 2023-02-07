Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root to: 'books#index'
  resources :books do
    collection do
      get 'search'
    end
  end  
  resources :old_books do
    resources :orders, only: [:index, :create]
  end
end
