Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :users, except: [:index]

resources :drinks

resources :drinks_users, only: [:create, :destroy]

resources :sessions, only: [:destroy, :new]

end
