Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :create, :destroy]

  resources :subs, only: [:new, :create, :index, :show, :edit, :update]

  resources :posts, only: [:new, :create, :show, :edit, :update]

  post '/posts/:id/downvote', to: 'posts#downvote', as: 'downvote'
  post '/posts/:id/upvote', to: 'posts#upvote', as: 'upvote'

end
