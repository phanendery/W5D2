Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resource :session
  resources :subs do
    resources :posts, only: [:new, :create, :show]
  end

  resources :posts

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
