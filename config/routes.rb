Rails.application.routes.draw do
  root 'events#index'
  devise_for :users

  resources :events do
    resources :comments, only: [:create]
    resources :attendees, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
