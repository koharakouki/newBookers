Rails.application.routes.draw do
  devise_for :users
  
  get 'homes/top'
  get 'home/about' => 'homes#about'

  root to: 'homes#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :books, only: [:create, :index, :show, :edit, :destroy, :update]

  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
