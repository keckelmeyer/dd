Rails.application.routes.draw do
  resources :plates
  resources :reviews
  #resources :categories
  #resources :states
  #resources :ratings
  #resources :contacts, only: [:new, :create]
  #resources :visitors, only: [:new, :create]
  root to: 'reviews#new'
  get 'get_plate' => 'reviews#get_plate'
  get 'averages' => 'reviews#averages'
end
