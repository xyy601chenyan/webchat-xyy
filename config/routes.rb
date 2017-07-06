Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :friendships
  resources :users, only: [:index]

   resources :conversations, only: [:create,:index] do
     resources :messages
   end
  root 'friendships#index'
end
