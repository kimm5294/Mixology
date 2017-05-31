Rails.application.routes.draw do

resources :users, except: [:index]

resources :drinks, only: [:create, :show] do
  collection do
    get 'search'
    get 'display'
  end
end

resources :drinks_users, only: [:create, :destroy]

resources :sessions, only: [:destroy, :new, :create]

root 'homepage#index'

end
